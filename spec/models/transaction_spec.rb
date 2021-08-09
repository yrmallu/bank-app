require 'rails_helper'

RSpec.describe Transaction, type: :model do

  let(:transaction) { create(:transaction) }

  describe 'associations' do
    it { should belong_to(:bank_account).class_name('BankAccount') }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(transaction).to be_valid
    end

    it 'is not valid without bank account' do
      transaction.bank_account_id = ''
      expect(transaction).to_not be_valid
    end

    it 'is not valid without amount' do
      transaction.amount = ''
      expect(transaction).to_not be_valid
    end

    it 'is not valid without transaction type' do
      transaction.transaction_type = ''
      expect(transaction).to_not be_valid
    end

    it 'is not valid without transaction number' do
      transaction.transaction_number = ''
      expect(transaction).to_not be_valid
    end

    it 'is not valid without receipt' do
      transaction.recipient_id = ''
      expect(transaction).to_not be_valid
    end

    it 'has a unique transaction number' do
      create(:transaction, transaction_number: '1234')

      transaction2 = build(:transaction, transaction_number: '1234')
      expect(transaction2).to_not be_valid
    end

  end
end
