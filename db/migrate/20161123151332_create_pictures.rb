class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.integer :iread_id
      t.string :file
      t.string :url

      t.timestamps
    end
    add_index :pictures, :iread_id
  end
end
