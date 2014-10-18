class AddRemainingDaysToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :remaining_days, :int
  end
end
