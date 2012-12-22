FactoryGirl.define do
  
  factory :basic_order_detail do
    first_name "joe"
    last_name "smith"
    phone "312-202-2222"
    quantity 1
  end
  
  factory :electronic_raffle_order do
    address1 "23 pueblo"
    address2 "apt 2"
    email "joe@joe.com"
    association :basic_order_detail, factory: :basic_order_detail
  end
  
end
