class AddUserAcountToBookReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :book_reviews, :user_acount, :string
  end
end
