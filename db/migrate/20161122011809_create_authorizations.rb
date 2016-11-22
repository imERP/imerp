class CreateAuthorizations < ActiveRecord::Migration[5.0]
  def change
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id

      t.timestamps

      t.index ["provider", "uid"], name: "index_authorizations_on_provider_and_uid", using: :btree

    end

  end
end
