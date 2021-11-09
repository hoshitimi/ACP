class BookReview < ApplicationRecord
validate :error_check
 def error_check
    if comment.length >= 50
        errors[:base] << "レビューは50文字以上書いてください"
    end
 end
end
