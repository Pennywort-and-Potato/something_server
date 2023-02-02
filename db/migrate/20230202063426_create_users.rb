class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :email
      t.string :role
      t.boolean :is_deleted
      t.string :password_digest

      t.timestamps
    end
  end
end
