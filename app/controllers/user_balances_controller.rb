class UserBalancesController < ApplicationController
  def info
    user_id = params[:user_id]
    user_balance = UserBalance.find_by_user(user_id)
    if user_balance
      render json: {status: 200, user_balance: user_balance.get_info}
    else
      render json: {status: 502, error: 'Cannot find user'}
    end
  end
end
