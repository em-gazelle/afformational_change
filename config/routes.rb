Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'

  devise_for :users

  get 'home', to: 'home#show', as: 'home'

  resources :afformations, except: [:show]
  resources :sent_afformations, only: [:index, :edit, :update]

end
