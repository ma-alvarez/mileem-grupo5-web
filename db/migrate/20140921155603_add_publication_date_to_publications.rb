class AddPublicationDateToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :publication_date, :datetime
  end
end
