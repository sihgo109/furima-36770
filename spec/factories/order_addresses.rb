FactoryBot.define do
  factory :order_address do
    postal_code {'123-4567'}
    area_id {1}
    city {'北海道'}
    place {'1-1'}
    building {'テックビル'}
    phone_number {'01023456789'}
  end
end