require 'spec_helper'

describe ElectronicRaffleOrdersController do

  describe 'new electronic raffle order' do
    it 'should create a new electronic raffle order' do
      order_params=FactoryGirl.attributes_for(:electronic_raffle_order)
      order = ElectronicRaffleOrder.new(order_params)
      ElectronicRaffleOrder.stub(:new).and_return(order)
      get :new
      assigns(:order).should_not be_nil
      response.should render_template 'new'
    end
  end
  
  describe 'create electronic raffle order' do
    
    it 'should save the raffle information with payment' do
      order_params=FactoryGirl.attributes_for(:electronic_raffle_order)
      order = ElectronicRaffleOrder.new(order_params)
      ElectronicRaffleOrder.should_receive(:new).and_return(order)
      post :create, :electronic_raffle_order => order_params
      response.should redirect_to electronic_raffle_order_path(order)
    end
  end

end
