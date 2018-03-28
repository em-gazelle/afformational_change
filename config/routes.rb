Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#show'

  devise_for :users

  get 'home', to: 'home#show', as: 'home'

  resources :afformations, except: [:show]
  resources :sent_afformations, only: [:index, :edit, :update]

  namespace :api do
  	namespace :v1 do
      post 'user_token' => 'user_token#create'

  		resources :afformations, except: [:show]
  		resources :sent_afformations, only: [:index, :edit, :update]

      get 'home', to: 'home#first_time_or_logged_out', as: 'first_time_or_logged_out'
  	end
  end

end
