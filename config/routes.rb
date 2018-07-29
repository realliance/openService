Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events do
    resources :participants, only: [:index, :create, :destroy]
  end


  root to: 'pages#root'

  namespace :admin do
    resource :settings, only: [:show, :update]
  end
end
