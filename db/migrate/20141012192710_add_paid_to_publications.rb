class AddPaidToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :paid, :boolean
  end
end
