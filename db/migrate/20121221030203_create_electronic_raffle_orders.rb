class CreateElectronicRaffleOrders < ActiveRecord::Migration
  def change
    create_table :electronic_raffle_orders do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :email
      t.string :phone
      t.integer :quantity

      t.timestamps
    end
  end
end
