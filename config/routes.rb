Rails.application.routes.draw do
  resources :simples
  resources :forms
  resources :pins
  root to:'pins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
