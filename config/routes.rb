Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :routes do
    resources :records
  end
  resources :dogs
  resources :reservations do
    resources :chatrooms, only: :create
  end
  get "profile/:id", to: "pages#profile", as: :profile
  resources :users do
    resources :reviews, only: :create
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
