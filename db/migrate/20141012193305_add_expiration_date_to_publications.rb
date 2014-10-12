class AddExpirationDateToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :expiration_date, :date
  end
end
