FactoryBot.define do
  factory :part do
    id { 1 }
    code { 2069587 }
    name { 'MUNICÍPIO DE GUAJURU' }
    created_at { 1.days.ago }
    updated_at { 1.days.ago }

    trait :without_code do
      code { nil }
    end

    trait :without_name do
      name { nil }
    end
  end
end