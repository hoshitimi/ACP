class CreateBookReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :book_reviews do |t|
      t.integer :comment_id
      t.integer :book_id
      t.integer :user_id
      t.string :comment
      t.integer :good
      t.boolean :flag

      t.timestamps
    end
  end
end
