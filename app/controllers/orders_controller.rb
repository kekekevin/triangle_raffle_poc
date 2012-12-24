class OrdersController < ApplicationController
  
  force_ssl :only => :index
  
  if "production" == ENV["RAILS_ENV"] 
    http_basic_authenticate_with :name => "admin", :password => "password"
  end
  
  def index
    @electronic_raffle_orders = ElectronicRaffleOrder.all
  end
  
end
