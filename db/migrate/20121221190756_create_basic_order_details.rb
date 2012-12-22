class CreateBasicOrderDetails < ActiveRecord::Migration
  def change
    create_table :basic_order_details do |t|
      t.string :first_name
      t.string :last_name
      t.integer :quantity
      t.string :phone

      t.timestamps
    end
  end
end
