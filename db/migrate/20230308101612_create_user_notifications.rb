class CreateUserNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :user_notifications do |t|
      t.string :body
      t.boolean :is_read
      t.belongs_to :user, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
