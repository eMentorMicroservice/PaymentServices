class AddTransactionTypeToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :trans_type, :integer
  end
end
