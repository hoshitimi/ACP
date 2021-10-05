class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :user_code
      t.string :category
      t.string :title
      t.string :contents

      t.timestamps
    end
  end
end
