class AddRelevanceToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :relevance, :integer
  end
end
