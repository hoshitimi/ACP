Rails.application.routes.draw do
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'

  post '/books_search', to:"home#search"
  post '/', to: 'home#search'
  resources :books
  resources :users
  resources :book_reviews
  resources :points
  resources :question_reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
