class RemoveBasicOrderDetailsFromElectronicRaffleOrder < ActiveRecord::Migration
  def up
    remove_column :electronic_raffle_orders, :first_name
    remove_column :electronic_raffle_orders, :last_name
    remove_column :electronic_raffle_orders, :phone
    remove_column :electronic_raffle_orders, :quantity
  end

  def down
    add_column :electronic_raffle_orders, :quantity, :integer
    add_column :electronic_raffle_orders, :phone, :string
    add_column :electronic_raffle_orders, :last_name, :string
    add_column :electronic_raffle_orders, :first_name, :string
  end
end
