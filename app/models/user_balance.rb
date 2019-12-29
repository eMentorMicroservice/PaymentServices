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

  def find_card(card_id)
    self.user_cards.find_by(id: card_id)
  end

  def self.find_by_user(user_id)
    self.create_with(balance: 0).find_or_create_by(user_id: user_id)
  end

  def pay(tutor, amount)
    Transaction.transfer(self.id, tutor.id, Money.new(amount))
  end
end
