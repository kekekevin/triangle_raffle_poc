class AddTotalToElectronicRaffleOrders < ActiveRecord::Migration
  def change
    add_column :electronic_raffle_orders, :total, :decimal, :null => false, :default => BigDecimal('0.00'), :precision => 2, :scale => 8
  end
end
