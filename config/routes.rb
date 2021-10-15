Rails.application.routes.draw do
<<<<<<< HEAD
  get 'home/top'
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'
  post '/books_search', to: 'home#search'
=======
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'

  post '/books_search', to:"home#search"
>>>>>>> 52c4a21accc205804d2d5f68a8ed18ee23a949bd
  post '/', to: 'home#search'
  resources :books
  resources :users
  resources :book_reviews
  resources :points
  resources :question_reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
