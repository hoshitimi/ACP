class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :user_acount
      t.integer :authority
      t.integer :point
      t.string :password

      t.timestamps
    end
  end
end
