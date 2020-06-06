Rails.application.routes.draw do
  get 'meetup/check'
  get 'meetup/submit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'pages#home'

get 'get_suggestion', to: 'suggest#get'

post 'check_available', to: 'meetup#check', via: :post

end
