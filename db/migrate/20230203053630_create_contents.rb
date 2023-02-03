class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.belongs_to :post, foreign_key: true
      t.string :alt
      t.string :src
      t.string :content_type
      t.bigint :view, :default => 0
      t.bigint :like, :default => 0
      t.bigint :dislike, :default => 0
      t.float :rating, :default => 0

      t.timestamps
    end
  end
end
