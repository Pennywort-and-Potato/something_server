class AddDefaultMemberToRoleForUser < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :string, :default => "member"
  end
end
