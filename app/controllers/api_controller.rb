class ApiController < ApplicationController
  respond_to :json  

  def all_publications
    @publications = Publication.all
    respond_with @publications
  end

end