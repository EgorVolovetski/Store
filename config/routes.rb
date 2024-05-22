Rails.application.routes.draw do
  devise_for :manufactures
  devise_for :users
  resource :users
  get 'home/index'
  root 'home#index'
  get 'user/index'
  get 'manufacture/index'
  get "up" => "rails/health#show", as: :rails_health_check
end
