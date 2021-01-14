Rails.application.routes.draw do
  get 'sessions/new'
  namespace :admin do
    resources :reviews
    get 'static_pages/home'
    get 'static_pages/help'
  end
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete 'logout',to: 'sessions#destroy'
  resources :users
  resources :books, only: :show
end

