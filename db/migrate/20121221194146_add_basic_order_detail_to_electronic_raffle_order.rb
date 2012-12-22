class AddBasicOrderDetailToElectronicRaffleOrder < ActiveRecord::Migration
  
  def change
    
    add_column :electronic_raffle_orders, :basic_order_detail_id, :integer
    
    change_column :electronic_raffle_orders, :basic_order_detail_id, :integer, :null => false
    
  end
  
end
