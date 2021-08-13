class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.decimal :amount_usd, precision: 10, scale: 2, :default => 1000, :null => false
      t.decimal :amount_btc, precision: 10, scale: 8, :default => 0.1, :null => false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
