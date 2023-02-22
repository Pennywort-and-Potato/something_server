class CreateUploadPools < ActiveRecord::Migration[7.0]
  def change
    create_table :upload_pools do |t|
      t.string :src
      t.string :content_type

      t.timestamps
    end
  end
end
