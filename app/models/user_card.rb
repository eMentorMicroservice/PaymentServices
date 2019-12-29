class UserCard < ApplicationRecord
  validates :card_number,  credit_card_number: true
  belongs_to :user_balance
  has_many :transactions
  before_validation :strip_card_number

  def brand
    detector = CreditCardValidations::Detector.new(self.card_number)
    detector.brand.to_s
  end

  def last_number
    self.card_number.split(//).last(4).join
  end

  def encode_number
    'X'*(self.card_number.length-4)+self.last_number
  end

  def create_withdraw(amount)
    if self.user_balance.balance >= Money.new(amount)
      transaction = self.transactions.build(direction: :withdraw, amount: amount)
      transaction.save
      transaction
    else
      nil
    end
  end

  def info
    {
      id: self.id,
      user_id: self.user_balance.user_id,
      brand: self.brand,
      card_name: card_name,
      last_number: self.last_number,
      card_length: self.card_number.length,
      expired_month: self.expired_month,
      expired_year: self.expired_year,
    } 
  end

  def self.detect(number)
    @detector = CreditCardValidations::Detector.new(number)
    if @detector.valid?
      @detector.brand.to_s
    else
      nil
    end
  end

  private

  def strip_card_number
    self.card_number.gsub(/\s+/, '')
  end

end
