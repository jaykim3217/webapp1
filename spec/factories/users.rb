FactoryBot.define do
  factory :user do
    name              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'000000a'}
    password_confirmation {password}
  end
end