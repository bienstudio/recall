Rails.application.routes.draw do
  root to: 'recall#index'

  get '/calendar', to: 'recall#calendar'

  get '/login', to: 'sessions#new'
  post '/sessions/create', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/join', to: 'users#new'
  get '/settings', to: 'users#settings'

  resources :tasks
  resources :reminders
  resources :courses
  resources :projects
end
