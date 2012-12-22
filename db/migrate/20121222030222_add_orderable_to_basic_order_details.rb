class AddOrderableToBasicOrderDetails < ActiveRecord::Migration
  def change
    add_column :basic_order_details, :orderable_id, :integer
    add_column :basic_order_details, :orderable_type, :string
  end
end
