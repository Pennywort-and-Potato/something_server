class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.string :body
      t.bigint :view, :default => 0
      t.bigint :like, :default => 0
      t.bigint :dislike, :default => 0
      t.float :rating, :default => 0

      t.timestamps
    end
  end
end
