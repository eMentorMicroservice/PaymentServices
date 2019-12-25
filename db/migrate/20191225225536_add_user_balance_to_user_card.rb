class AddUserBalanceToUserCard < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_cards, :user_balance, null: false, foreign_key: true
  end
end
