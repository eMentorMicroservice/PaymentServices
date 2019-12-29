class Transaction < ApplicationRecord
  monetize :amount_cents, :allow_nil => true
  monetize :fee_cents, :allow_nil => true

  has_one :sender, class_name: 'UserBalance', foreign_key: 'sender_id'
  has_one :receiver, class_name: 'UserBalance', foreign_key: 'receiver_id'

  WATTING_DAYS = 7.days

  enum trans_type: [:deposit, :withdraw, :transfer]
  enum status: [:holding, :completed, :cancel]
  
  def self.transfer(sender, receiver, amount)
    t = Transaction.new(
      sender_id: sender, 
      receiver_id: receiver, 
      trans_type: Transaction.trans_types[:transfer],
      executed_at: Date.current.to_datetime+WATTING_DAYS,
      amount: amount
    )
    t.save
  end
  

  
end
