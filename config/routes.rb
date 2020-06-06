Rails.application.routes.draw do
  root to: 'pages#home'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get 'welcome', to: 'sessions#welcome'




  get 'friends_list', to: 'friends#get_friends_list'
  get 'get_friend_by_username', to: 'friends#get_friend_by_username'
  get 'suggestions', to: 'suggestions#get_suggestions'

  post 'add_friend', to: 'friends#add_friend'
  post 'set_friend', to: 'sessions#welcome'
  post 'log_event', to: 'sessions#welcome'  # call or meetup




  # get 'authorized', to: 'sessions#page_requires_login'



  get 'get_token', to: 'sessions#get_token'


end





  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
