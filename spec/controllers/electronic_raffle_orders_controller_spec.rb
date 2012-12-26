require 'spec_helper'

describe ElectronicRaffleOrdersController do
  
  let(:order) { mock_model('ElectronicRaffleOrder', :save_with_payment => true) }
  
  describe 'new electronic raffle order' do
    it 'should create a new electronic raffle order' do
      ElectronicRaffleOrder.should_receive(:new).and_return(order)
      order.should_receive(:basic_order_detail=)
      BasicOrderDetail.should_receive(:new).and_return(mock_model('BasicOrderDetail'))
      get :new
      assigns(:order).should_not be_nil
      assigns(:basic_order_detail).should_not be_nil
      response.should render_template 'new'
    end
  end
  
  describe 'create electronic raffle order' do
    it 'should save the raffle information with payment' do
      ElectronicRaffleOrder.should_receive(:new).and_return(order)
      post :create, :electronic_raffle_order => {}
      response.should redirect_to electronic_raffle_order_path(order)
    end
  end

end
