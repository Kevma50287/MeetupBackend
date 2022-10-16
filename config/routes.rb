Rails.application.routes.draw do


  resources :hangouts

  #TODO: only: %i[create destroy update]
  resources :messages
  
  resources :users_in_chats, only: %i[ create destroy ]

  # TODO: only: %[show create destroy update]
  resources :chats

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
