Rails.application.routes.draw do
   #devise_for :users, :controllers =>{
     #:registrations => 'users/registrations',
     #:sessions => 'users/sessions'
   #}
  devise_for :users
  #devise_scope :user do
    #get "sign_in", :to => "users/sessions#new"
    #get "sign_out", :to => "users/sessions#destory"
  #end
   
  resources :items, only: [:index, :new, :create] do 
  end
  root to: 'items#index'
  post 'items/new' => 'items#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
