class AddVideoLinkToPublications < ActiveRecord::Migration
  def change
    add_column :publications, :video_link, :string
  end
end
