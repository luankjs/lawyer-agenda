FactoryBot.define do
  factory :lawyer do
    trait :standard do
      id { 1 }
      name { 'Pedro' }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
    end

    trait :without_id do
      id { nil }
      name { 'Pedro' }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
    end

    trait :without_name do
      id { 1 }
      name { nil }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
    end

    trait :without_created_at do
      id { 1 }
      name { 'Pedro' }
      created_at { nil }
      updated_at { 1.days.ago }
    end

    trait :without_updated_at do
      id { 1 }
      name { 'Pedro' }
      created_at { 1.days.ago }
      updated_at { nil }
    end

    trait :uncomon_name do
      id { 1 }
      name { 'P3dro' }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
    end
  end
end