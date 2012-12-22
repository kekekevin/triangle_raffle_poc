
order_detail = BasicOrderDetail.create!({:first_name => "foo", :last_name => "bar", :quantity => 1, phone: "1231231231"})
order_detail.orderable = ElectronicRaffleOrder.create!({:email => 'joe@corp.com'})
order_detail.save!

order_detail = BasicOrderDetail.create!({:first_name => "joe", :last_name => "smith", :quantity => 1, phone: "1231231231" })
order_detail.orderable = ElectronicRaffleOrder.create!({:email => 'foo@bar.com'})
order_detail.save!

