Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  
  get '/dashboard' => 'myadmin/dashboard#index'
  get '/dashboard/users' => 'myadmin/users#index'
  get '/dashboard/users/show' => 'myadmin/users#show'
  get '/dashboard/users/new' => 'myadmin/users#create'
  get '/dashboard/users/edit' => 'myadmin/users#edit'
  get '/dashboard/users/destroy' => 'myadmin/users#destroy'
  get '/dashboard/invitation' => 'myadmin/invitation#index'
end
