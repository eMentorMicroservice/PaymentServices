class AddInfoToUserCard < ActiveRecord::Migration[6.0]
  def change
    add_column :user_cards, :card_name, :string
    add_column :user_cards, :expired_month, :integer
    add_column :user_cards, :expired_year, :integer
  end
end
