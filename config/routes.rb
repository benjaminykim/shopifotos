Rails.application.routes.draw do
  root              :to => 'app#home'
  get '/home',      :to => 'app#home'
  get '/about',     :to => 'app#about'
  get '/contact',   :to => 'app#contact'
  get '/profile',   :to => 'app#profile'
  get '/signup',    :to => 'users#new'
  resources :users
end
