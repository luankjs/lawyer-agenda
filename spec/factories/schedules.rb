FactoryBot.define do
  factory :schedule do
    trait :standard do
      adjudicating_part_code { 405 }
      year { 2022 }
      number { 6 }
      kind { "O" }
    end

    trait :without_adjudicating_part_code do
      adjudicating_part_code { nil }
      year { 2022 }
      number { 6 }
      kind { "O" }
    end

    trait :without_year do
      adjudicating_part_code { 405 }
      year { nil }
      number { 6 }
      kind { "O" }
    end

    trait :without_number do
      adjudicating_part_code { 405 }
      year { 2022 }
      number { nil }
      kind { "O" }
    end

    trait :without_kind do
      adjudicating_part_code { 405 }
      year { 2022 }
      number { 6 }
      kind { nil }
    end

    trait :with_other_kind do
      adjudicating_part_code { 405 }
      year { 2022 }
      number { 6 }
      kind { 'A' }
    end
  end
end