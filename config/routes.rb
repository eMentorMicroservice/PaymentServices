Rails.application.routes.draw do
  namespace :user_cards do
    post 'save_card'
    get 'validate_card'
  end
end
