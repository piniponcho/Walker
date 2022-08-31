Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Defines the root path route ("/")
  # root "articles#index"
  resources :routes do
    resources :records
  end
  resources :dogs
  resources :reservations
  get "profile/:id", to: "pages#profile", as: :profile
  resources :users do
    resources :reviews, only: :create
  end

  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  #   collection do
  #     resources :reviews, only: :create
  #   end
  # end
end
