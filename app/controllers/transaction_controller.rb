class TransactionController < ApplicationController
  def withdraw
    user_id = params[:user_id]
    card_id = params[:card_id]
    amount = params[:amount]
    user_balance = UserBalance.find_by_user(user_id)
    card = user_balance.find_card(card_id)
    if card
      transaction = card.create_withdraw(card, user_balance)
      render json: {status: 200, transaction: transaction.to_json}
    else
      render json: {status: 502, error: "Cannot find user's credit card"}
  end
end
