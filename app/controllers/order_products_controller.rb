class OrderProductsController < ApplicationController
  def create
    chosen_product = Product.find(params[:order_product][:product_id])
    current_cart = @current_cart

    @order_product = OrderProduct.new
    @order_product.cart = current_cart
    @order_product.product = chosen_product
    authorize @order_product

    if @order_product.save!
      redirect_to cart_path(current_cart)
    else
      redirect_to product_path(chosen_product)
    end
  end


  def destroy
    @order_product = OrderProduct.find(params[:id])
    authorize @order_product
    @order_product.destroy
    redirect_to cart_path(@current_cart)
  end

  private

  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :cart_id)
  end
end
