class AddCoordinatesToRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :routes, :latitude, :float
    add_column :routes, :longitude, :float
  end
end
