class ElectronicRaffleOrder < ActiveRecord::Base
  attr_accessible :address1, :address2, :email, :first_name, :last_name, :phone, :quantity
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates :quantity, :numericality => { :only_integer => true, :greater_than =>  0 }

  validates_format_of :email, :with => /^.+@.+$/
  
end
