class ApiController < ApplicationController	
  respond_to :json
 

  def all_publications
  	@publications = Publication.all
    respond_with @publications.as_json(include: {publication_attachments: {only: :image}})
  end

  def filter_publications
  	params.each do |key,value|
      Rails.logger.info "Param #{key}: #{value}"
	  end
	  @publications = Publication.all
	  respond_with @publications.as_json(include: {publication_attachments: {only: :image}})
  end

end