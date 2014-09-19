class ApiController < ApplicationController	
  respond_to :json
 

  def all_publications
  	@publications = Publication.all
    respond_with @publications.as_json(include: {publication_attachments: {only: :image}})
  end

end