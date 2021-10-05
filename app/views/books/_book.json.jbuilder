json.extract! book, :id, :user_id, :isbn, :title, :author_name, :book_number, :flag, :created_at, :updated_at
json.url book_url(book, format: :json)
