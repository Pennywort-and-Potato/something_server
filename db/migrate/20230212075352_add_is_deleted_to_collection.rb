class AddIsDeletedToCollection < ActiveRecord::Migration[7.0]
  def change
    add_column :collections, :is_deleted, :boolean, default: false
  end
end
