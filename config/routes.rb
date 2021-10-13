Rails.application.routes.draw do
<<<<<<< HEAD
  get 'home/top'
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'
=======

  post '/books_search', to: 'home#search'
  post '/', to: 'home#search'
>>>>>>> c033f3c248784f7846b89b200de595360e2882fa
  resources :books
  resources :users
  resources :questions
  resources :book_reviews
  resources :points
  resources :question_reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
