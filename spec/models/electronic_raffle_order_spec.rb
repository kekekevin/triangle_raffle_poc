require 'spec_helper'

describe ElectronicRaffleOrder do
  subject do
    FactoryGirl.build(:electronic_raffle_order)
  end

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
end
