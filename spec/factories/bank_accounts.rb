FactoryBot.define do
  factory :bank_account do
    account_number {'21221311111'}
    balance {'200'}
    user
  end
end
