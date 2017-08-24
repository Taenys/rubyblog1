class CreatePostsTable < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content, limit: 4294967295
    end
  end
end
