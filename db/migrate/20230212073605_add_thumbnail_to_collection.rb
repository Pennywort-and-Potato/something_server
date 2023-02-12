class AddThumbnailToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :thumbnail, :string
  end
end
