json.extract! question, :id, :user_code, :category, :title, :contents, :created_at, :updated_at
json.url question_url(question, format: :json)
