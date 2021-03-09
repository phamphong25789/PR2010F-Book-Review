Rails.application.routes.draw do

  scope "(:locale)", locale: /en|vi/ do
  end
  
	root 'static_pages#home'
	get '/help', to: 'static_pages#help'
	get '/about', to: 'static_pages#about'
	get '/contact', to: 'static_pages#contact'
	get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  get '/book/category/:category', to: 'books#index'
  resources :favorites, only: [:index, :destroy]
	resources :users
	resources :books, only: [:show, :index] do
    resources :rates
  end
  mount Ckeditor::Engine => '/ckeditor'

  get 'sessions/new'

  namespace :admin do
    root 'static_pages#home'
    resources :reviews
    resources :authors
    resources :categories
    resources :books
    get 'static_pages/home'
    get 'static_pages/help'
  end

  resources :reviews

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users

  resources :comments
end