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

end
