class AddPublicationDateToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :publication_date, :date
  end
end
