Rails.application.routes.draw do
  get 'friends/get'
  get 'friends/add'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'pages#home'
get 'getfriends', to: 'pages#getfriends'
end
