class AddAreaToRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :routes, :area, :integer
  end
end
