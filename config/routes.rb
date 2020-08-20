Rails.application.routes.draw do
   
  devise_for :users
   
  resources :items do 
  end
  root to: 'items#index'
end
