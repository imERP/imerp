class AddMidToIreads < ActiveRecord::Migration[5.0]
  def change
    add_column :ireads, :mid, :float
  end
end
