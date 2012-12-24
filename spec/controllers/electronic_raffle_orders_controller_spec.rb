require 'spec_helper'

describe ElectronicRaffleOrdersController do

  describe 'new electronic raffle order' do
    it 'should create a new electronic raffle order' do
      ElectronicRaffleOrder.stub(:new).and_return({})
      get :new
      assigns(:order).should_not be_nil
      response.should render_template 'new'
    end
  end
  
  describe 'create electronic raffle order' do
    
    it 'should save the stripe token in the session' do
      order_params=FactoryGirl.attributes_for(:electronic_raffle_order)
      post :create, :stripe_token => 'test_token', :order => order_params
      session[:stripe_token].should == 'test_token'
    end
    
    it 'should save the card information in the session' do
      order_params=FactoryGirl.attributes_for(:electronic_raffle_order)
      card = {'type' => 'visa'}
      post :create, :stripe_card => card, :order => order_params
      session[:stripe_card].should == card
    end
    
    it 'should save the raffle information with payment' do
      order_params=FactoryGirl.attributes_for(:electronic_raffle_order)
      order = ElectronicRaffleOrder.new(order_params)
      ElectronicRaffleOrder.should_receive(:new).and_return(order)
      post :create, :order => order_params
      response.should redirect_to electronic_raffle_order_path(order)
    end
  end

end
