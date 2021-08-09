FactoryBot.define do
  factory :transaction do
    amount { 10 }
    transaction_type { 'deposit' }
    transaction_number { rand(1..10) }
    recipient_id { rand(1..10) }
    bank_account
  end
end
