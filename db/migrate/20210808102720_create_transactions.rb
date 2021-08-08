class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :transaction_type
      t.references :bank_account, foreign_key: true
      t.string :transaction_number
      t.string :recipient_id

      t.timestamps
    end
  end
end
