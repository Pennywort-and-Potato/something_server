class CreatePostTags < ActiveRecord::Migration[7.0]
  def change
    create_table :post_tags do |t|

      t.belongs_to :tag, foreign_key: true, on_delete: :cascade
      t.belongs_to :post, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
