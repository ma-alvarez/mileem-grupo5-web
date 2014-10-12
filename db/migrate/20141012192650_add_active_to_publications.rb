class AddActiveToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :active, :boolean
  end
end
