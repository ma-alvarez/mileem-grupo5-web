class AddZoneToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :zone, :string
  end
end
