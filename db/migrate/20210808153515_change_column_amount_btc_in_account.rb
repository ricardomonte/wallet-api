class ChangeColumnAmountBtcInAccount < ActiveRecord::Migration[6.1]
  def change
    change_column :accounts, :amount_usd, :decimal, :precision => 6, :scale => 3, :default => 1,000, :null => false
    change_column :accounts, :amount_btc, :decimal, :precision => 12, :scale => 8, :default => 0,000.1, :null => false
  end
end
