class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    end

    @order = Order.create(order_params)
    Address.create(address_params)
    redirect_to root_path
  end
  
  private

  def order_params
    params.require(:order_address).permit(:postal_code, :region_id, :city, :address_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
