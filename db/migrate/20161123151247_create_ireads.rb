class CreateIreads < ActiveRecord::Migration[5.0]
  def change
    create_table :ireads do |t|
      t.string :caption
      t.string :caption_render

      t.timestamps
    end
  end
end
