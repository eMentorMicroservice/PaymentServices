class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :user_card, null: false, foreign_key: true
      t.integer :direction
      t.monetize :amount
      t.timestamps
    end
  end
end