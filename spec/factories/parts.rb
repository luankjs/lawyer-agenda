FactoryBot.define do
  factory :part do
    trait :standard do
      id { 1 }
      code { 2069587 }
      name { 'MUNICÍPIO DE GUAJURU' }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
    end

    trait :without_id do
      id { nil }
      code { 2069587 }
      name { 'MUNICÍPIO DE GUAJURU' }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
    end

    trait :without_code do
      id { 1 }
      code { nil }
      name { 'MUNICÍPIO DE GUAJURU' }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
    end

    trait :without_name do
      id { 1 }
      code { 2069587 }
      name { nil }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
    end

    trait :without_created_at do
      id { 1 }
      code { 2069587 }
      name { 'MUNICÍPIO DE GUAJURU' }
      created_at { nil }
      updated_at { 1.days.ago }
    end

    trait :without_updated_at do
      id { 1 }
      code { 2069587 }
      name { 'MUNICÍPIO DE GUAJURU' }
      created_at { 1.days.ago }
      updated_at { nil }
    end
  end
end