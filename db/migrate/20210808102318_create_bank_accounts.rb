class CreateBankAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_accounts do |t|
      t.references :user, foreign_key: true
      t.decimal :balance
      t.string :account_number

      t.timestamps
    end
  end
end
