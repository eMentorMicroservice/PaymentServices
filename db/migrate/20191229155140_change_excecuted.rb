class ChangeExcecuted < ActiveRecord::Migration[6.0]
  def change
    rename_column :transactions, :excecuted_at, :executed_at
  end
end
