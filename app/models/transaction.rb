class Transaction < ApplicationRecord
  belongs_to :bank_account

  TRANSACTION_TYPES = %w[withdraw deposit transfer].freeze

  validates :bank_account, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES }
  validates :transaction_number, presence: true, uniqueness: true
  validates :recipient_id, presence: true

  before_validation :load_defaults

  def load_defaults
    self.transaction_number = SecureRandom.uuid if new_record? && !transaction_number.present?
  end
end
