class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.belongs_to :user, foreign_key: true, on_delete: :nullify
      t.belongs_to :post, foreign_key: true, on_delete: :nullify
      t.string :name

      t.timestamps
    end
  end
end
