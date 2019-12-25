class CreateUserCards < ActiveRecord::Migration[6.0]
  def change
    create_table :user_cards do |t|
      t.integer :user_id
      t.string :card_number
      t.date :expired_at

      t.timestamps
    end
    add_index :user_cards, :user_id
  end
end
