class CreateQuestionCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :question_categories do |t|
      t.integer :category_id
      t.string :category_name

      t.timestamps
    end
  end
end
