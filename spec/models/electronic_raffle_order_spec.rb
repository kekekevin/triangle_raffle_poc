require 'spec_helper'

describe ElectronicRaffleOrder do

  it { should_not allow_value("asdf").for(:email) }
  
  it { should allow_value("asdf@asdf.com").for(:email) }
  
  it 'should have basic order details' do
    order = FactoryGirl.build(:electronic_raffle_order)
    order.basic_order_detail should_not be_nil
  end
end
