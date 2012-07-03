NolaOnRails::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  resources :accounts do
    get "payment", on: :member
    get "alumni", on: :collection
    resources :courses, only: [:index]
  end

  resources :courses do
    resources :session do
      resources :videos, only: [:index, :show, :create, :update, :destroy]
      resources :presentations, only: [:index, :show, :create, :update, :destroy]
      resources :samples, only: [:index, :show, :create, :update, :destroy]
      resources :links, only: [:index, :show, :create, :update, :destroy]
    end
  end

  get 'about' => "pages#about"
  get 'contact' => "pages#contact"
  get 'prices' => "pages#prices"
  get 'alumni' => "pages#alumni"
  get 'terms' => "pages#terms"
  get 'policies' => "pages#policies"

  root to: "pages#splash"
end
