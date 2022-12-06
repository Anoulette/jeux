Rails.application.routes.draw do
  root to: "games#index"
  devise_for :users

  # bookings est nested à games (voir les routes sur le user stories)
  resources :games do
    resources :bookings
  end
end
