class OrderProductsController < ApplicationController

  def create
    @order_product = OrderProduct.new
  end

  private

  def order_product_params
    params.require(:order_products).permit(:order_id, :product_id, :size, :quantity, :price)
  end
end
