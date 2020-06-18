class ProductsController < ApplicationController

  def index
    @products = policy_scope(Product)
  end

  def product_params
    params.require(:product).permit(:name, :price, :size, :photo, :description, :category_id)
  end
end
