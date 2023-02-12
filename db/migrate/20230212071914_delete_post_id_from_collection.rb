class DeletePostIdFromCollection < ActiveRecord::Migration[7.0]
  def change
    remove_column :collections, :post_id
  end
end
