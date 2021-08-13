class ChangeColumnAmountSendInTransaction < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :amount_send, :decimal, :precision => 12, :scale => 8
  end
end
