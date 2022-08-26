FactoryBot.define do
  factory :lawyer do
    id { 1 }
    name { 'Pedro' }
    created_at { 1.days.ago }
    updated_at { 1.days.ago }

    trait :without_name do
      name { nil }
    end

    trait :uncomon_name do
      name { 'P3dro' }
    end
  end
end