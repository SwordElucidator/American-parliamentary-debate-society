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
  post '/', to: 'home#index'
  get '/home/edit', to: 'home#edit'
  get '/index/:id', to: 'users#homepage', as: 'customer'
  get '/forum', to: "posts#index"
  post '/forum', to: "posts#index"
  get '/profile', to: "profile#profile"
  post '/profile', to: "profile#profile", as: 'update_profile'
  get '/invitation', to: "invitation#index"
  post '/invitation', to: "invitation#index"

  get '/mockdebate', to: "debate#index"
  get '/mockdebate/create', to: "debate#create"
  post '/mockdebate/create', to: "debate#create"
  get '/mockdebate/:id(.:format)/update', :to => 'debate#update'
  post '/mockdebate/:id(.:format)/update', :to => 'debate#update'

end
