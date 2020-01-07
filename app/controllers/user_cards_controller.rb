class UserCardsController < ApplicationController
  def check
  end

  def save_card
    user_id = params[:user_id]
    month = params[:expired_month].to_i
    year = params[:expired_year].to_i
    card_number = params[:card_number]
    card_name = params[:card_name]
    user_balance = UserBalance.find_by(user_id: user_id)
    card = UserCard.new(
      user_balance_id: user_balance.id, 
      card_number: card_number,
      card_name: card_name,
      expired_month: month,
      expired_year: year
    )
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
      render json: {status: 502, error: 'Invalid Card Number'}
    end
  end
end
