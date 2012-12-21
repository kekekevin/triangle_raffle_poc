class RemoveNameFromElectronicRaffleOrders < ActiveRecord::Migration
  def up
    remove_column :electronic_raffle_orders, :name
  end

  def down
    add_column :electronic_raffle_orders, :name, :string
  end
end
