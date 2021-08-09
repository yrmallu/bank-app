require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user) }

  describe 'associations' do
    it { should have_one(:bank_account).class_name('BankAccount') }
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid without email' do
      user.email = ''
      expect(user).to_not be_valid
    end

    it 'is not valid with invalid email format' do
      user.email = 'reddy'
      expect(user).to_not be_valid
    end

    it 'is not valid without password' do
      user.password_digest = ''
      expect(user).to_not be_valid
    end

    it 'is not valid with password less than 8 chars' do
      user.password = '123'
      expect(user).to_not be_valid
    end

    it 'has a unique email' do
      create(:user, email: 'example@gmail.com')

      user2 = build(:user, email: 'example@gmail.com')
      expect(user2).to_not be_valid
    end

  end
end
