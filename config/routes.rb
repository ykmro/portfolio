Rails.application.routes.draw do
  root "top#index"

  resources :situations, only: [:index] do
    member do
      get :result
    end
  end

  resources :steps, only: [:show] do
    member do
      post :next
      get :result
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end