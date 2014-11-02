class AddRetiredAtToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :retired_at, :datetime
  end
end
