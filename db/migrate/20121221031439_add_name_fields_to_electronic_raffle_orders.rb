class AddNameFieldsToElectronicRaffleOrders < ActiveRecord::Migration
  def change
    add_column :electronic_raffle_orders, :first_name, :string
    add_column :electronic_raffle_orders, :last_name, :string
  end
end
