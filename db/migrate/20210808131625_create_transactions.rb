class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :coin_to_send
      t.string :coin_to_receive
      t.decimal :amount_send, precision: 10
      t.decimal :amount_receive, precision: 10
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
