Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root "home#index"
  post '/signupProcess', to: 'users#signupProcess'
  get '/signup', to: 'users#signup'
  post '/signup', to: 'users#signup'
  get '/index/:id', to: 'users#homepage', as: 'customer'
  get '/login', to: 'users#login'
  post '/login', to: 'users#login'
  get '/forum', to: "posts#index"
  post '/forum', to: "posts#index"
end
