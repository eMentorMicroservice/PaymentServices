class AddExcecuteToTransaction < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :excecuted_at, :datetime
  end
end
