FactoryBot.define do
  factory :item do
   
    item_name {"あいう"}
    item_detail {"あいう"}
    category_id {2}
    status_id  {2}
    shipping_fee_id  {2}
    from_location_id {2}
    days_till_ship_id {2}
    price {"300"}
    association :user

    
    
  
end
end
