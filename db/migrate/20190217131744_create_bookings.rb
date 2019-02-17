class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :storage, foreign_key: true
      t.date :star_date
      t.date :end_date
      t.boolean :approved

      t.timestamps
    end
  end
end