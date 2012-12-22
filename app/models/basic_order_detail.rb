class BasicOrderDetail < ActiveRecord::Base
  
  attr_accessible :first_name, :last_name, :phone, :quantity
  
  validates_presence_of :first_name
  
  validates_presence_of :last_name
  
  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }
  
end
