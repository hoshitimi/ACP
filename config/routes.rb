Rails.application.routes.draw do

  post '/books_search', to: 'home#search'
  post '/', to: 'home#search'
  resources :books
  resources :users
  resources :questions
  resources :book_reviews
  resources :points
  resources :question_reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
