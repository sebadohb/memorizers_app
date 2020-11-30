Rails.application.routes.draw do
  devise_for :users
  root to: "dictionaries#index"
  resources :dictionaries
end
