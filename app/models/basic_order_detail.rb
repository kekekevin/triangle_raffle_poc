class BasicOrderDetail < ActiveRecord::Base
  
  attr_accessible :first_name, :last_name, :phone, :quantity
  
  belongs_to :orderable, :polymorphic => true
  
  validates_presence_of :first_name
  
  validates_presence_of :last_name
  
  validates :quantity, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
  
end
