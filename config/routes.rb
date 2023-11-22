Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :categories, only: [:index, :new, :show, :create] do
    resources :items, only: [:index, :new, :show, :create]
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_scope :user do
    authenticated :user do
      root to: 'categories#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'splash_screen#index'
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end