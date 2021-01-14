Rails.application.routes.draw do
	root 'static_pages#home'
	get '/help', to: 'static_pages#help'
	get '/about', to: 'static_pages#about'
	get '/contact', to: 'static_pages#contact'
	get '/signup', to: 'users#new'
	resources :users
	resources :books, only: :show do
    resources :rates
  end
  namespace :admin do
    get 'static_pages/home'
    get 'static_pages/help'
  end
end
