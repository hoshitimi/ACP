Rails.application.routes.draw do
  resources :question_categories
  get 'home/top'
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'
  post '/', to: 'books#search'
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'
  post 'home/logout'
  get 'home/approval_book_index'
  post 'home/approval_book'
  get 'home/approval_book_review_index'
  post 'home/approval_book_review'

  post '/books_search', to:"books#search"
  post '/good_add' , to:"book_reviews#good_add"
  post '/show' ,to:"books#show"
  post '/', to: 'books#search'
  post '/questions_search', to:"questions#search"
  post '/', to: 'questions#search'
  post '/questions_best_answer', to:"questions#best_answer"
  post '/', to: 'questions#best_answer'
  post '/users_search', to:"users#search"
  post '/', to: 'users#search'
  post 'question_reviews/best_check', to:"question_reviews#bestcheck"
  post '/', to: 'question_reviews#best_check'
  resources :books
  resources :users
  resources :book_reviews
  resources :points
  resources :question_reviews
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
