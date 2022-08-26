FactoryBot.define do
    factory :trial do
      id { 1 }
      number { 2069587 }
      created_at { 1.days.ago }
      updated_at { 1.days.ago }
  
      trait :without_number do
        number { nil }
      end
    end
  end