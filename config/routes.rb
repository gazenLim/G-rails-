Rails.application.routes.draw do

  resources :users

  get '/dealers/ordernew', to: 'dealers#ordernew', as: 'order_new'

  resources :dealers do
  resources :orders
  end
  resources :dealers
  resources :orders



  get '/auth/:provider/callback', to: 'sessions#omniauth'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

get 'login', to: 'sessions#new'
post 'login', to: 'sessions#create'
get 'welcome', to: 'sessions#welcome'
delete '/logout', to: 'sessions#destroy'







get '/:anything', to: "application#wrong_page"

get '/', to: 'application#welcome'
end
