FactoryBot.define do 
  factory :review do
    title { Faker::Lorem.characters(content:10)}
    body { Faker ::Lorem.characters(content:30)}
    is_settled{"false"}
    customer_id{1}
  end
end