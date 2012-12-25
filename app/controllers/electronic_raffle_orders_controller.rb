class ElectronicRaffleOrdersController < ApplicationController
  
  def new
    @order = ElectronicRaffleOrder.new
    @basic_order_detail = BasicOrderDetail.new
    @order.basic_order_detail = @basic_order_detail
  end
  
  def create
    @order = ElectronicRaffleOrder.new(params[:electronic_raffle_order])
    if @order.save_with_payment
      redirect_to @order
    else
      render :new
    end
  end
end
