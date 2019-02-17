class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.string :name
      t.string :dial_code
      t.string :code

      t.timestamps
    end
  end
end
