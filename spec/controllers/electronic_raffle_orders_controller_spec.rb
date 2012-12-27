require 'spec_helper'

describe ElectronicRaffleOrdersController do
  
  let(:order) { mock_model('ElectronicRaffleOrder') }
  before(:each) do
    ElectronicRaffleOrder.should_receive(:new).and_return(order)    
  end
  
  describe 'new electronic raffle order' do
    it 'should create a new electronic raffle order' do
      order.should_receive(:basic_order_detail=)
      BasicOrderDetail.should_receive(:new).and_return(mock_model('BasicOrderDetail'))
      get :new
      assigns(:order).should_not be_nil
      assigns(:basic_order_detail).should_not be_nil
      response.should render_template 'new'
    end
  end
  
  describe 'creating an electronic raffle order' do
    describe 'with a valid order' do
      let(:mail) { mock('ElectronicRaffleOrderMailer') }
      
      before(:each) do
        order.should_receive(:save_with_payment).and_return(true)
      end
    
      it 'should redirect to a confirmation page and send an email confirmation' do
        mail.should_receive(:deliver)
        ElectronicRaffleOrderMailer.should_receive(:electronic_order_confirmation).with(order).and_return(mail)
        post :create, :electronic_raffle_order => {}
        response.should redirect_to electronic_raffle_order_path(order)
      end
      
    end
    
    describe 'with an invalid order' do
      before(:each) do
        order.should_receive(:save_with_payment).and_return(false)
      end
      
      it 'should render the new view' do
        post :create, :electronic_raffle_order => {}
        response.should render_template 'new'
      end
    end
    
  end
  
end
