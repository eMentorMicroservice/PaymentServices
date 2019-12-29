class TransactionController < ApplicationController
  def withdraw
    user_id = params[:user_id]
    card_id = params[:card_id]
    amount = params[:amount]
    user_balance = UserBalance.find_by_user(user_id)
    card = user_balance.find_card(card_id)
    if card
      transaction = card.create_withdraw(amount)
      if transaction
        render json: {status: 200, 
          transaction: {
            id: transaction.id, 
            card_id: transaction.user_card_id,
            card_numer: transaction.user_card.encode_number, 
            amount: transaction.amount.format
          }
        }
      else
        render json: {status: 502, error: "User do not have sufficent balance"}
      end
    else
      render json: {status: 502, error: "Cannot find user's credit card"}
    end
  end
end
