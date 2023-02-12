class CreateCollectionContents < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_contents do |t|

      t.belongs_to :collection, foreign_key: true
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
