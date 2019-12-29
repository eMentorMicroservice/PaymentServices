class RemoveExpiredAtFromUserCard < ActiveRecord::Migration[6.0]
  def change

    remove_column :user_cards, :expired_at, :datetime
  end
end
