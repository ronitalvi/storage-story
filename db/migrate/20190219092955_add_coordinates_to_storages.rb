class AddCoordinatesToStorages < ActiveRecord::Migration[5.2]
  def change
    add_column :storages, :latitude, :float
    add_column :storages, :longitude, :float
  end
end
