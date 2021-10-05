json.extract! question_review, :id, :question_code, :user_code, :contents, :best_flag, :created_at, :updated_at
json.url question_review_url(question_review, format: :json)
