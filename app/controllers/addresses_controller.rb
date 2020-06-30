class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]

  def new
    @address = Address.new
    authorize @address
  end

  def create
    @address = Address.new(address_params)
    authorize @address
  end

  def edit
  end

  def update
    if @address.update(address_params)
    else
      render :edit
    end
  end

  private

  def address_params
    params.require(:address).permit(:address1, :address2, :postcode, :city, :phone_number, :first_name, :last_name, :email)
  end

  def set_product
    @address = Address.find(params[:id])
    authorize @address
  end
end
