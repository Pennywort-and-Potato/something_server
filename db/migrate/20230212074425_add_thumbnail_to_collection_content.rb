class AddThumbnailToCollectionContent < ActiveRecord::Migration[7.0]
  def change
    add_column :collection_contents, :thumbnail, :string
  end
end
