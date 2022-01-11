class BookReview < ApplicationRecord
    belongs_to :user, primary_key: :user_id, foreign_key: :user_id
    belongs_to :book
validate :error_check
 def error_check
    if comment.length < 50
        errors[:base] << "レビューは50文字以上書いてください"
    end
 end
end
