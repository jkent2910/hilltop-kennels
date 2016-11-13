Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'


  root 'welcome#index'

   resources :navigation_items
   resources :pages
   resources :dogs

  get '/' =>'welcome#index', as: 'home'


end
