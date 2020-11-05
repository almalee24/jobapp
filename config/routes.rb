Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  resources :positions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'search', :to => 'articles#index'
  root to: "positions#index"
end
