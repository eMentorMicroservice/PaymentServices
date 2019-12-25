class UserCardsController < ApplicationController
  def check
  end

  def save_card
    user_id = params[:user_id]
    month = params[:month].to_i
    year = params[:year].to_i
    card_number = params[:card_number].gsub(/\s+/, '')
    expired_at = DateTime.new(year, month, 1)
    card = UserCard.new(user_id: user_id, card_number: card_number, expired_at: expired_at)
    if card.save
      render json: {status: 200, credit_card: card.info}
    else
      render json: {status: 502, error: 'Invalid Card'}
    end
  end

  def validate_card
    card_number = params[:card_number]
    brand = UserCard.detect(card_number)
    if brand
      render json: {status: 200, brand: brand}
    else
      render json: {status: 502, error: 'Invalid'}
    end
  end
end
