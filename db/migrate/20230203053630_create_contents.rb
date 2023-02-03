class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.belongs_to :post, foreign_key: true
      t.string :alt
      t.string :src
      t.string :content_type
      t.bigint :view
      t.bigint :like
      t.bigint :dislike
      t.float :rating

      t.timestamps
    end
  end
end
