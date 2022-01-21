class QuestionReview < ApplicationRecord
    belongs_to :question, class_name: 'Question', foreign_key: 'question_code'

    validate :error_check

    def error_check
        if contents.blank?
            errors[:base] << 'コメントを入力してください'
        end
    end
end

