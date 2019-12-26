class Transaction < ApplicationRecord
  belongs_to :user_card
  monetize :amount_cents, :allow_nil => true
  enum direction: [:withdraw, :deposit]
  
  def self.create_withdraw(card, amount)
    self.user_balance >= 
  end

  
end
