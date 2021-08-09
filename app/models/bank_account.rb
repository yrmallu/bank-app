class BankAccount < ApplicationRecord

  belongs_to :user
  has_many :transactions

  validates :user, presence: true
  validates :balance, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :account_number, presence: true, uniqueness: true

  before_validation :load_defaults

  def load_defaults
    return unless new_record?

    self.balance = 0.00 unless balance.present?
    self.account_number = SecureRandom.uuid unless account_number.present?
  end

  def to_s
    account_number
  end
end
