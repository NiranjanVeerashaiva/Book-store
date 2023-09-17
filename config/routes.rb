Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#  resources :book_store
 
  get "/book_store/new", to: "book_store#new", as: :new_book_store
  get "/book_store/:id", to: "book_store#show", as: :book_store
  patch "/book_store/:id", to: "book_store#update"
  delete "/book_store/:id", to: "book_store#delete"
  get "/book_store/:id/edit", to: "book_store#edit", as: :edit_book_store
  post "/book_store", to: "book_store#create", as: :book_stores
  #Defines the root path route ("/")
  root "book_store#index"
end
