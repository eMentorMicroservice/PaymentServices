class RemoveUserCardFromTransaction < ActiveRecord::Migration[6.0]
  def change
    remove_reference :transactions, :user_card, null: false, foreign_key: true
  end
end
