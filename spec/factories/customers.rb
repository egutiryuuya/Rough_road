FactoryBot.define do
  factory :customer do
    name{'ほげほげ男'}
    email {Faker::Internet.free_email}
    password{'aaBB234'}
    password_confirmation{password}
    is_deleted{'false'}
  end
end