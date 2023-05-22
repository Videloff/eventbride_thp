Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :admin do
    resources :users
    root to: 'users#index'
  end

  resources :events do
    resources :attendances, except: [:new]
    resources :event_pictures, only: [:create]
  end

  # Defines the root path route ("/")
  root to: "events#index"

  resources :users, only: [:show, :edit, :update]

  # set root redirect '/' to '/gossips' as index 
  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

end
