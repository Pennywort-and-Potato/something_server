class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.string :body
      t.bigint :view
      t.bigint :like
      t.bigint :dislike
      t.float :rating

      t.timestamps
    end
  end
end
