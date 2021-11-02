Rails.application.routes.draw do
  resources :question_categories
  get 'home/top'
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'
<<<<<<< HEAD
  post '/books_search', to: 'books#search'
=======
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'
>>>>>>> 768de728903dac2252b566f2010d06726654c401
  post 'home/logout'


  post '/books_search', to:"books#search"
  post '/', to: 'books#search'
  post '/questions_search', to:"questions#search"
  post '/', to: 'questions#search'
  post '/users_search', to:"users#search"
  post '/', to: 'users#search'
  resources :books
  resources :users
  resources :book_reviews
  resources :points
  resources :question_reviews
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
