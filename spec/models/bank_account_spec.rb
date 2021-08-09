require 'rails_helper'

RSpec.describe BankAccount, type: :model do

  let(:bank_account) { create(:bank_account) }

  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:transactions).class_name('Transaction') }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(bank_account).to be_valid
    end

    it 'is not valid without account number' do
      bank_account.account_number = ''
      expect(bank_account).to_not be_valid
    end

    it 'is not valid without amount' do
      bank_account.balance = ''
      expect(bank_account).to_not be_valid
    end

    it 'is not valid with negative balance' do
      bank_account.balance = -10
      expect(bank_account).to_not be_valid
    end

    it 'is not valid without user' do
      bank_account.user_id = ''
      expect(bank_account).to_not be_valid
    end

    it 'has a unique account number' do
      user = create(:user, email: 'example@gmail.com')

      create(:bank_account, user_id: user.id, account_number: '1234')
      bank_account2 = build(:bank_account, account_number: '1234')
      expect(bank_account2).to_not be_valid
    end

  end
end
