Rails.application.routes.draw do
  devise_for :users
  root to: "dictionaries#index"
  resources :users, only: [:index, :show]
  resources :dictionaries, shallow: true do
    resources :comments, only: [:create, :destroy]
    resource :bookmarks, only: [:create, :destroy]
     get :bookmarks, on: :collection
     get :flashcards, on: :collection
  end
end
