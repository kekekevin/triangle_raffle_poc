class AddTotalToElectronicRaffleOrders < ActiveRecord::Migration
  def change
    add_column :electronic_raffle_orders, :total, :decimal, :null => false, :default => BigDecimal('0.00'), :precision => 8, :scale => 2
  end
end
