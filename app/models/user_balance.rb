class UserBalance < ApplicationRecord
  monetize :balance_cents, :allow_nil => true
  validates :user_id, presence: true, uniqueness: true
  has_many :user_cards

  def get_info
    {
      id: self.id,
      user_id: self.user_id,
      balance: self.balance.format
    }
  end
end
