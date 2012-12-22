Given /^the following basic order details exist:$/ do |table|
  table.hashes.each do |basic_order_detail|
    orderable_id = basic_order_detail.delete('orderable_id')
    orderable_type = basic_order_detail.delete('orderable_type')
    
    basic_order_detail = BasicOrderDetail.create!(basic_order_detail)
    
    basic_order_detail.orderable_id = orderable_id
    basic_order_detail.orderable_type = orderable_type
    
    basic_order_detail.save!
  end
end

Given /^the following electronic raffle orders exist:$/ do |table|
  table.hashes.each do |electronic_raffle_order|
    ElectronicRaffleOrder.create!(electronic_raffle_order)
  end
end

Given /^I am logged in as an administrator$/ do

end

When /^I visit the view raffle orders page$/ do
  visit orders_path
end

Then /^I can see the order for (.*)$/ do |first_name|
  rows = page.all(:xpath, './/tr', :text => /#{Regexp.escape(first_name)}/)
  rows.should_not be_nil
end

Then /^I can see all electronic raffle orders$/ do
  rows = page.find(:xpath, '//tbody').all(:xpath, './/tr')
  rows.size.should == ElectronicRaffleOrder.all.size
end