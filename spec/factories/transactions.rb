FactoryBot.define do
  factory :transaction do
    association :invoice
    credit_card_number {4654405418249678}
    credit_card_expiration_date {""}
    result {"success"}
  end
end
