FactoryBot.define do
  factory :organization, class: Organization do
    code { Faker::Company.czech_organisation_number }
    name { Faker::Company.name }
  end
end
