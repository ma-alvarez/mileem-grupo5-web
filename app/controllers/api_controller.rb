class ApiController < ApplicationController	
  respond_to :json
 

  def all_publications
  	@publications = Publication.all
  	  @publications.each do |p|
      @images = PublicationAttachment.where(publication_id: p.id)
      p.publication_attachments = @images
    end
    respond_with @publications.as_json(include: {publication_attachments: {only: :image}})
  end

end