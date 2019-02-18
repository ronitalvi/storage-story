class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :booking, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
