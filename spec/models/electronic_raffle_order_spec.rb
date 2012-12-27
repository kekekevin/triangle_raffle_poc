require 'spec_helper'

describe ElectronicRaffleOrder do
  subject do
    FactoryGirl.build(:electronic_raffle_order)
  end

  it { should validate_presence_of :email }
  
  it { should validate_presence_of :stripe_token } 

  it { should_not allow_value("asdf").for(:email) }
  
  it { should allow_value("asdf@asdf.com").for(:email) }
  
  it 'should have basic order details' do
    subject.basic_order_detail should_not be_nil
  end
  
  it 'should delegate first name' do
    subject.first_name.should == subject.basic_order_detail.first_name
  end
  
  it 'should delegate last name' do
    subject.last_name.should == subject.basic_order_detail.last_name
  end
  
  it 'should delegate quantity' do
    subject.quantity.should == subject.basic_order_detail.quantity
  end
  
  it 'should delegate phone' do
    subject.phone.should == subject.basic_order_detail.phone
  end
  
  describe 'save_with_payment' do
    
    it 'should should not save! if invalid' do
      subject.should_receive(:valid?).at_least(:once).and_return(false)
      subject.should_not_receive(:save!)
      subject.save_with_payment
    end
    
    describe 'with a valid order' do
      before(:each) do
        subject.should_receive(:valid?).at_least(:once).and_return(true)
      end
      
      it 'should call save!' do
        Stripe::Charge.should_receive(:create)
        subject.should_receive(:save!)
        subject.save_with_payment
      end
      
      it 'should create a charge' do
        subject.stripe_token = "xdfs"
        Stripe::Charge.should_receive(:create).with(:amount => 5000, :currency => "usd", :card => "xdfs", :description => "Triangle Raffle Tickets")
        subject.save_with_payment
      end
      
      it 'should return an error on invalid request to stripe' do
        Stripe::Charge.should_receive(:create).and_raise(Stripe::InvalidRequestError.new("message", "param"))
        subject.save_with_payment.should == false
      end
      
      it 'should return an error on card error to stripe' do
        Stripe::Charge.should_receive(:create).and_raise(Stripe::CardError.new("message", "param", "code"))
        subject.save_with_payment.should == false
        subject.errors.get(:base).should_not be_nil
      end
      
      it 'should save the total' do
        subject.save_with_payment
        subject.total.should == BigDecimal('50.00')
      end
      
    end
  end
end
