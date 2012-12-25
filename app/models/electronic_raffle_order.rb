class ElectronicRaffleOrder < ActiveRecord::Base
  attr_accessible :address1, :address2, :email, :basic_order_detail_attributes, :stripe_token, :card_last_4_digits, :card_type
  
  attr_accessor :stripe_token, :card_last_4_digits, :card_type
  
  has_one :basic_order_detail, :as => :orderable
  
  validates :email, :presence => true, :format => {:with => /^.+@.+$/}
  
  delegate :first_name, :last_name, :quantity, :phone, :to => :basic_order_detail, :allow_nil => true
  
  accepts_nested_attributes_for :basic_order_detail
  
  def save_with_payment
    if valid?
      save!
    end
  end
  
end
