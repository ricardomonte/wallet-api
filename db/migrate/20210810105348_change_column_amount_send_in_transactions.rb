class ChangeColumnAmountSendInTransactions < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :amount_send, :decimal, :precision => 12
    change_column :transactions, :amount_receive, :decimal, :precision => 12
  end
end
