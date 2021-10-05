json.extract! book_review, :id, :comment_id, :book_id, :user_id, :comment, :good, :flag, :created_at, :updated_at
json.url book_review_url(book_review, format: :json)
