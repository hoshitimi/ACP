class RemoveCommentIdFromBookReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :book_reviews, :comment_id, :integer
  end
end
