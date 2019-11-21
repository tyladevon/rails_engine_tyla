FactoryBot.define do
  factory :item do
    name {"Jasmin"}
    description {"Blooming jasmin plant"}
    unit_price {15}
    association :merchant
  end
end
