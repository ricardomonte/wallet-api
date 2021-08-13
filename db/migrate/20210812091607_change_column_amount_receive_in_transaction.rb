class ChangeColumnAmountReceiveInTransaction < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :amount_receive, :decimal, :precision => 12, :scale => 8
  end
end
