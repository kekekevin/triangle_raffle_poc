class ElectronicRaffleOrdersController < ApplicationController
  
  force_ssl
  
  def new
    @order = ElectronicRaffleOrder.new
    @basic_order_detail = BasicOrderDetail.new
    @order.basic_order_detail = @basic_order_detail
  end
  
  def create
    @order = ElectronicRaffleOrder.new(params[:electronic_raffle_order])
    if @order.save_with_payment
      ElectronicRaffleOrderMailer.electronic_order_confirmation(@order).deliver
      redirect_to @order
    else
      render :new
    end
  end
end
