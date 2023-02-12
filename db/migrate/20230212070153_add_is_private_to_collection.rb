class AddIsPrivateToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :is_private, :boolean, default: false
  end
end
