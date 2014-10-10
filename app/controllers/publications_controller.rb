class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /publications
  # GET /publications.json
  def index
    @publications = current_user.publications
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = current_user.publications.new
    @publication_attachment = @publication.publication_attachments.build
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    error = false
    @publication = current_user.publications.build(publication_params)
    max = max_attachments(@publication.relevance)
    if @publication.save
      if params[:publication_attachments]
        params[:publication_attachments]['image'].each { |image|
          if @publication.publication_attachments.count < max 
            @publication.publication_attachments.create(image: image, publication_id: @publication.id)
          else
            error = true
          end  
        }
      end
        flash[:notice] = "La publicación fue creado con éxito."
        if error
          flash[:error] = "Advertencia: al menos alguna imagen no ha sido cargada. Usted alcanzó el máximo de imágenes permitido por su cuenta: " + max.to_s + " imágenes"
        end
        redirect_to @publication
      else
       render :new
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    error = false
    max = max_attachments(@publication.relevance)
    if @publication.update(publication_params)
      if params[:publication_attachments]
        params[:publication_attachments]['image'].each { |image|
          if @publication.publication_attachments.count < max 
              @publication.publication_attachments.create(image: image, publication_id: @publication.id)
            else
              error = true 
            end
        }
      end
      flash[:notice] = "La publicación ha sido actualizada"
      if error 
       flash[:error] = "Advertencia: al menos alguna imagen no ha sido cargada. Usted alcanzó el máximo de imágenes permitido por su cuenta: " + max.to_s + " imágenes"
      end
      redirect_to @publication
    else
      render :edit
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'La publicación ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
      gon.lat = @publication.latitude
      gon.lng = @publication.longitude
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:transaction_type, :property_type, :address, :latitude, :longitude, :area, :zone, :publication_date, :number_of_rooms, :price, :expenses, :age, :currency, :relevance, publication_attachments_attributes: [:id, :publication_id, :image])
    end

    def max_attachments(relevance)
      if relevance == 1
        return 3
      elsif relevance == 2
        return 5
      elsif relevance == 3
        return 10
      end
    end

    def format_error
      flash[:error] = "No se ha podido agregar la imagén posee un formato incorrecto, formatos permitidos: jpeg,jpg,png"
    end
end
