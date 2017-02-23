class CreateApiV1Products < ActiveRecord::Migration[5.0]
  def change
    create_table :api_v1_products do |t|
      t.string :code
      t.string :name
      t.string :standard
      t.string :pattern
      t.decimal :cost
      t.decimal :price
      t.string :use
      t.text :explanation
      t.boolean :can_sale
      t.integer :sales
      t.decimal :sales_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
