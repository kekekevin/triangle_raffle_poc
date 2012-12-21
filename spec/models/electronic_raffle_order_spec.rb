require 'spec_helper'

describe ElectronicRaffleOrder do
  it { should validate_presence_of(:first_name) }

  
  it { should validate_presence_of(:last_name) }
  
  it { should validate_numericality_of(:quantity).only_integer }
  
  it 'must have a quantity greater than zero' do
    order = FactoryGirl.build(:electronic_raffle_order, :quantity => 0)
    order.should_not be_valid
  end
  
  it { should_not allow_value("asdf").for(:email) }
  
  it { should allow_value("asdf@asdf.com").for(:email) }
end
