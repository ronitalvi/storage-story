class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.string :photo
      t.integer :sqm
      t.float :price
      t.string :address
      t.text :description
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
