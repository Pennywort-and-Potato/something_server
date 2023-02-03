class AddIsDeletedToContent < ActiveRecord::Migration[7.0]
  def change
    add_column :contents, :is_deleted, :boolean, :default => false
  end
end
