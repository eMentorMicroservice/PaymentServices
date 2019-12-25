class RemoveUserIdFromUserCard < ActiveRecord::Migration[6.0]
  def change

    remove_column :user_cards, :user_id, :integer
  end
end
