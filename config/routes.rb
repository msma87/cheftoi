Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :services do
    resources :bookings, only: [:new, :create, :show, :destroy]
    collection do
      get :my
    end
  end

  # Health check para uptime monitors
  get "up" => "rails/health#show", as: :rails_health_check
end
