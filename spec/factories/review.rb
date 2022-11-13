FactoryBot.define do 
  factory :review do
    title { Faker::Lorem.characters(number:10)}
    body { Faker::Lorem.characters(number:30)}
    is_settled{"false"}
    customer_id {10000}
    id{10000}
    created_at  {Time.now}
    updated_at  {Time.now}
  end
end
