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
  end

  def new
    @order = Order.new
    authorize @order
    @cart = @current_cart
  end

  def create
    @order = Order.new(order_params)
    @current_cart.order_products.each do |order_product|
      @order.order_products << order_product
      order_product.cart_id = nil
    end
    if @order.save!
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      redirect_to root_path
    else
      redirect_to cart_path(@current_cart)
    end
  end

  private

  def order_params
    params.require(:order).permit(:address1, :address2, :amount_cents, :status, :user_id, :postcode, :city, :phone_number, :first_name, :last_name, :email)
  end
end
