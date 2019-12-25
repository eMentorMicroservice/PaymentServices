class CreateUserBalances < ActiveRecord::Migration[6.0]
  def change
    create_table :user_balances do |t|
      t.integer :user_id
      t.monetize :balance
      t.timestamps
    end
    add_index :user_balances, :user_id
  end
end
