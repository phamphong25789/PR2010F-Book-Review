Rails.application.routes.draw do
  namespace :admin do
    get 'static_pages/home'
    get 'static_pages/help'
  end
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
