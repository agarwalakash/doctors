Rails.application.routes.draw do
  resources :appointments do 
  	member do
  		get "accept"
  	end
  end
  resources :availabilities
  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
