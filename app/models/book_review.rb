class BookReview < ApplicationRecord
validate :error_check
 def error_check
    Rails.logger.debug("==========1========")
    if comment.length < 50
        Rails.logger.debug("==========2========")
        Rails.logger.debug(comment.length)
        errors[:base] << "レビューは50文字以上書いてください"
    end
 end
end
