class OrderProductsController < ApplicationController
  def create
    chosen_product = Product.find(params[:order_product][:product_id])
    current_cart = @current_cart

    # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
    if current_cart.products.include?(chosen_product)
      # Find the order_product with the chosen_product
      @order_product = current_cart.order_products.find_by(product_id: chosen_product)
      # Iterate the order_product's quantity by one
      @order_product.quantity += 1
      @order_product.price = chosen_product.price
    else
      @order_product = OrderProduct.new
      @order_product.cart = current_cart
      @order_product.product = chosen_product
      @order_product.price = chosen_product.price
    end
    authorize @order_product

    # Save and redirect to cart show path
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

  def add
    @order_product = OrderProduct.find(params[:id])
    authorize @order_product
    @order_product.quantity += 1
    @order_product.save
    redirect_to cart_path(@current_cart)
  end

  def reduce
    @order_product = OrderProduct.find(params[:id])
    authorize @order_product
    if @order_product.quantity > 1
      @order_product.quantity -= 1
    end
    @order_product.save
    redirect_to cart_path(@current_cart)
  end

  private

  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :size, :quantity, :price, :cart_id)
  end
end
