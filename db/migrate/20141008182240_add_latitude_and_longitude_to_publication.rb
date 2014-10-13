class AddLatitudeAndLongitudeToPublication < ActiveRecord::Migration
  def change
    add_column :publications, :latitude, :float
    add_column :publications, :longitude, :float
  end
end
