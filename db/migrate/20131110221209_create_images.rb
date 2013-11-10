class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :token
      t.text :data_uri

      t.timestamps
    end

    add_index :images, :token, :unique => true
  end
end
