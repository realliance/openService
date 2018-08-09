Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :events do
    resources :participants, only: [:create, :destroy]
    get '/sign_in_sheet.pdf', to: 'participants#index', as: 'sign_in_sheet'
  end

  resources :announcements, except: [:index]


  root to: 'pages#root'

  namespace :admin do
    get '/dashboard', to: 'settings#dashboard', as: 'dashboard'
    get '/users', to: 'settings#users', as: 'users'
  end
end
