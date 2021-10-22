class QuestionReview < ApplicationRecord
    belongs_to :question, class_name: 'Question', foreign_key: 'question_code'
end
