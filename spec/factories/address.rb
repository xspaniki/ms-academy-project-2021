FactoryBot.define do
  factory :address, class: Address do
    association :user, factory: [:user]

    street { Faker::Address.street_name }
    city { Faker::Address.city }
    zipcode { Faker::Address.zip_code }
  end
end
