Rails.application.routes.draw do
  get 'home/top'
  get 'home/kanri'
  get 'home/login'
  post 'home/login_check'
  resources :books
  resources :users
  resources :questions
  resources :book_reviews
  resources :points
  resources :question_reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
