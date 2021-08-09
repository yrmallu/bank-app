require 'rails_helper'

RSpec.describe Transactions::Perform, type: :model do
  describe '#execute' do
    let(:sender) { create(:user, email: 'user1@gmail.com') }
    let!(:sender_account) { create(:bank_account, account_number: '2322113345', balance: 1_000, user: sender) }

    let(:receiver) { create(:user, email: 'user2@gmail.com') }
    let!(:receiver_account) { create(:bank_account, account_number: '232211333', balance: 0, user: receiver) }

    it 'subtract sender money, add receiver money, create both transactions' do
      Transactions::Perform.new(100, 'transfer', sender_account.id, receiver_account.account_number).execute!
      sender_account.reload
      receiver_account.reload
      expect(sender_account.balance).to eq(900)
      expect(receiver_account.balance).to eq(100)

      sender_transaction = Transaction.find_by(bank_account_id: sender_account.id)
      expect(sender_transaction.amount).to eq(100)
      expect(sender_transaction.bank_account_id).to eq(sender_account.id)
      expect(sender_transaction.recipient_id).to eq(receiver_account.account_number)

      receiver_transaction = Transaction.find_by(bank_account_id: receiver_account.id)
      expect(receiver_transaction.amount).to eq(100)
      expect(receiver_transaction.bank_account_id).to eq(receiver_account.id)
      expect(receiver_transaction.recipient_id).to eq(sender_account.account_number)
    end

  end
end