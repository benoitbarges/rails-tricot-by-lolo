class OrderProductsController < ApplicationController

  # def create
  #   @cart = current_user.cart
  #   authorize @cart
  #   @product = Product.find(params[:order_product][:product_id])
  #   @order_product = OrderProduct.new(order_product_params)
  #   authorize @order_product
  #   @order_product.product = @product
  #   @order_product.cart = @cart
  #   if @order_product.save
  #     redirect_to cart_path(@cart)
  #   else
  #     redirect_to product_path(@product)
  #   end
  # end

  private

  def order_product_params
    params.require(:order_product).permit(:order_id, :product_id, :size, :quantity, :price, :cart_id)
  end
end

        # <% if user_signed_in? %>
        #   <%= simple_form_for([@cart, OrderProduct.new]) do |f| %>
        #     <%= f.hidden_field :price, value: @product.price %>
        #     <%= f.hidden_field :product_id, value: @product.id %>
        #     <%= f.hidden_field :quantity, value: 1 %>
        #     <%= f.submit "Add to cart", class: "add-to-card-btn" %>
        #   <% end %>
        # <% else %>
