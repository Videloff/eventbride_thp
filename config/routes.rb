Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :events

  # Defines the root path route ("/")
  root to: "events#index"

  # set root redirect '/' to '/gossips' as index 
  # root to: redirect('/events')
end
