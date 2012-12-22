class OrdersController < ApplicationController
  force_ssl
  
  
  if :production == ENV["RAILS_ENV"] 
    http_basic_authenticate_with :name => "admin", :password => "password"
  end
  
  def index
    puts ENV["RAILS_ENV"]
    @electronic_raffle_orders = ElectronicRaffleOrder.all
  end
  
end
