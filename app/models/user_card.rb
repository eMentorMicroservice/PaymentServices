class UserCard < ApplicationRecord
  validates :card_number, presence: true, credit_card_number: true
  validates :expired_at, presence: true
  belongs_to :user_balance

  def brand
    detector = CreditCardValidations::Detector.new(self.card_number)
    detector.brand.to_s
  end

  def last_number
    self.card_number.split(//).last(4).join
  end

  def info
    {
      id: self.id,
      user_id: self.user_balance.user_id,
      brand: self.brand,
      last_number: self.last_number,
      card_length: self.card_number.length,
      month_expired_at: self.expired_at.month,
      year_expired_at: self.expired_at.year,
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



end
