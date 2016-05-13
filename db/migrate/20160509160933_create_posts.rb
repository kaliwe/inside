class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.integer :user_id
      t.integer :likes, null: false, default: 0
      t.integer :dislikes, null: false, default: 0

      t.timestamps
    end
    add_foreign_key :posts, :users
  end
end
