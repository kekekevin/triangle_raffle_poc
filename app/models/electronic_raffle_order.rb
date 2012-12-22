class ElectronicRaffleOrder < ActiveRecord::Base
  attr_accessible :address1, :address2, :email
  
  has_one :basic_order_detail, :as => :orderable
  
  validates_format_of :email, :with => /^.+@.+$/
  
  delegate :first_name, :last_name, :quantity, :phone, :to => :basic_order_detail
  
end
