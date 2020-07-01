class OrdersController < ApplicationController
  def index
    if current_user.admin?
      @orders = Order.all
    else
      @order = current_user.orders
    end
  end

  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def new
    @order = Order.new
    authorize @order
    @cart = @current_cart
  end

  def create
    @order = Order.new(order_params)
    authorize @order
    @order.user = current_user
    @order.amount = @current_cart.sub_total
    @current_cart.order_products.each { |order_product| @order.order_products << order_product }
    if @order.save
      trigger_stripe
      cleanup_cart
      redirect_to new_order_payment_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:address1, :address2, :amount_cents, :status, :user_id, :postcode, :city, :phone_number, :first_name, :last_name, :email)
  end

  def trigger_stripe
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: stripe_line_items(@order.order_products),
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )
    @order.update(checkout_session_id: session.id)
  end

  def stripe_line_items(order_products)
    order_products.map do |order_product|
      {
        name: order_product.product.name,
        amount: order_product.product.price_cents,
        currency: 'eur',
        quantity: 1
      }
    end
  end

  def cleanup_cart
    @current_cart.order_products.each { |order_product| order_product.update(cart_id: nil) }
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
  end
end
