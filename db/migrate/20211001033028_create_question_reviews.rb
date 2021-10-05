class CreateQuestionReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :question_reviews do |t|
      t.integer :question_code
      t.integer :user_code
      t.string :contents
      t.integer :best_flag

      t.timestamps
    end
  end
end
