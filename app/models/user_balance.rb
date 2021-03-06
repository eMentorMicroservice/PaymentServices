class UserBalance < ApplicationRecord
  monetize :balance_cents, :allow_nil => true
  validates :user_id, presence: true
  has_many :user_cards
end
