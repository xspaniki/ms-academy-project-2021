FactoryBot.define do
  factory :user, class: User do
    association :organization, factory: [:organization]

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sex { :non_binary }
    email { Faker::Internet.email }
    is_admin { false }
    password { 'password' }
    password_confirmation { 'password' }

    trait :admin do
      is_admin { true }
    end
    
    User.sexes.keys.each do |k|
      trait k do
        sex { k }
      end
    end
  end
end
