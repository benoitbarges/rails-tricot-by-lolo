class OrderProductsController < ApplicationController

  def create

    if current_user.cart.nil?
      @cart = Cart.create(user_id: current_user.id)
    else
      @cart = current_user.cart
    end
    authorize @cart
    @product = Product.find(params[:order_product][:product_id])
    authorize @product
    @order_product = OrderProduct.new(order_product_params)
    authorize @order_product
    @order_product.product = @product
    @order_product.cart = @cart
    if @order_product.save
      redirect_to cart_path(@cart)
    else
      raise
      redirect_to product_path(@product)
    end
  end

  private

  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :size, :quantity, :price, :cart_id)
  end
end
