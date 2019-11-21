FactoryBot.define do
  factory :merchant do
    sequence :name do |n|
      "Marble Florist and Greenhouse #{n}"
    end
  end
end
