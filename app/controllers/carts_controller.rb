class CartsController < ApplicationController

  def show
    @cart = current_user.cart
    authorize @cart
  end
end
