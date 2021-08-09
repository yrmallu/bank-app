require 'rails_helper'

RSpec.describe Transactions::Validate, type: :model do
  describe '#execute' do
    let(:sender) { create(:user, email: 'user1@gmail.com') }
    let!(:sender_account) { create(:bank_account, account_number: '2322113345', balance: 1_000, user: sender) }

    let(:receiver) { create(:user, email: 'user2@gmail.com') }
    let!(:receiver_account) { create(:bank_account, account_number: '232211333', balance: 0, user: receiver) }

    it 'when sender account not exists' do
      errors = Transactions::Validate.new(100, 'transfer', nil, receiver_account.account_number).execute!

      expect(errors).to eql(['Account not found'])
    end

    it 'when recipient account not exists' do
      errors = Transactions::Validate.new(100, 'transfer', sender_account.id, nil).execute!

      expect(errors).to eql(['Recipient Account not found'])
    end

    it 'when account not having sufficient funds' do
      errors = Transactions::Validate.new(2_000, 'transfer', sender_account.id, receiver_account.account_number).execute!

      expect(errors).to eql(['Not enough funds'])
    end

  end
end
