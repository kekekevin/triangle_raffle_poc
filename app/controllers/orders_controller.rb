class OrdersController < ApplicationController
  def index
    @electronic_raffle_orders = ElectronicRaffleOrder.all
  end
end
