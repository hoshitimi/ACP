class Book < ApplicationRecord
    belongs_to :book_reviews,foreign_key: :book_id
end
