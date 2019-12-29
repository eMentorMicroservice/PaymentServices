Rails.application.routes.draw do
  namespace :user_cards do
    post 'save_card'
    get 'validate_card'
  end

  namespace :user_balances do
    get 'info'
  end

  namespace :transaction do
    post 'withdraw'
  end
end
