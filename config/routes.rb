Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'


  root 'welcome#index'

   resources :navigation_items
   resources :pages
   resources :dogs
   resources :daycare_days

  get '/' =>'welcome#index', as: 'home'
  get '/daycare_schedule' => 'dogs#daycare_schedule', as: 'daycare_schedule'

  post 'daycare_days/remove_dog' => 'daycare_days#remove_dog'


end
