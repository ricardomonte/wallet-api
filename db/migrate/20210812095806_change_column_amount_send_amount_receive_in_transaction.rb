class ChangeColumnAmountSendAmountReceiveInTransaction < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :amount_send, :decimal, :precision => 15, :scale => 8
    change_column :transactions, :amount_receive, :decimal, :precision => 15, :scale => 8
  end
end
