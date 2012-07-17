NolaOnRails::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :accounts do
    get "card", on: :member
    get "activation", on: :member
    get "alumni", on: :collection
    resources :courses, only: [:index]
  end

  resources :courses do
    get "purchase", on: :member

    resources :meets do
      resources :videos, only: [:index, :show, :create, :update, :destroy]
      resources :presentations, only: [:index, :show, :create, :update, :destroy]
      resources :samples, only: [:index, :show, :create, :update, :destroy]
      resources :links, only: [:index, :show, :create, :update, :destroy]
    end
  end

  get 'signin' => "sessions#new", as: :signin
  get 'signout' => "sessions#destroy", as: :signout
  get 'signup' => "account#new", as: :signup
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')

  get 'about' => "pages#about"
  get 'contact' => "pages#contact"
  get 'prices' => "pages#prices"
  get 'alumni' => "accounts#alumni"
  get 'terms' => "pages#terms"
  get 'policies' => "pages#policies"

  root to: "pages#splash"
end
