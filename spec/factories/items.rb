FactoryBot.define do
  factory :item do
    item_name {Faker::Lorem.sentence}
    explain {Faker::Lorem.sentence}
    category_id {2}
    price {600}
    brand {Faker::Lorem.sentence}
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/image/chair1.jpeg'), filename: 'chair1.jpeg')
    end
  end
end
