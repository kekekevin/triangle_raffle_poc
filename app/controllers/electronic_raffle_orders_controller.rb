class ElectronicRaffleOrdersController < ApplicationController
  
  def new
    @order = ElectronicRaffleOrder.new
  end
  
  def create
    session[:stripe_token] = params[:stripe_token]
    session[:stripe_card] = params[:stripe_card]
    
    @order = ElectronicRaffleOrder.new(params[:order])
    if @order.save_with_payment
      redirect_to @order
    else
      render :new
    end
  end
end
