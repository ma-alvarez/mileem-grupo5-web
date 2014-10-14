class AddPauseCounterToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :pause_counter, :int
  end
end
