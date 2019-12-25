class UserCard < ApplicationRecord
  validates :card_number, presence: true, credit_card_number: true
  validates :user_id, :expired_at. presence: true

  def brand
    detector = CreditCardValidations::Detector.new(self.card_number)
    detector.brand.to_s
  end

  def self.detect(number)
    detector = CreditCardValidations::Detector.new(self.card_number)
    if detector.valid?
      dectector.brand.to_s
    else
      nil
    end
  end



end
