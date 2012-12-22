require 'spec_helper'

describe BasicOrderDetail do
  
  it { should validate_presence_of(:first_name) }
  
  it { should validate_presence_of(:last_name) }
  
  it { should validate_numericality_of(:quantity).only_integer }
  
  it 'must have a quantity greater than zero' do
    basic_order_detail = FactoryGirl.build(:basic_order_detail, :quantity => 0)
    basic_order_detail.should_not be_valid
  end
  
  it 'should belong to an orderable' do
    basic_order_detail = FactoryGirl.build(:basic_order_detail, :orderable => FactoryGirl.build(:electronic_raffle_order))
    basic_order_detail.orderable.should_not be_nil    
  end
  
end
