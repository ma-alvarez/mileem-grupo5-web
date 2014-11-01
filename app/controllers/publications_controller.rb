class PublicationsController < ApplicationController
  before_action :set_publication, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /publications
  # GET /publications.json
  def index
    if params.has_value?("Buscar")
      filter_hash = {}
      first_date = "2014-01-01".to_date
      last_date = "2100-01-01".to_date
      first_date = params[:first_date].to_date if !params[:first_date].blank?
      last_date = params[:last_date].to_date if !params[:last_date].blank?
      filter_hash[:publication_date] = first_date..last_date
      @publications = current_user.publications.where(filter_hash)
      @publications = Publication.not_retired_publications(@publications)
      if !params[:status].blank?
        if params[:status] == 'active'
          @publications = Publication.active_publications(@publications)
        end
        if params[:status] == 'missing_pay'
          @publications = Publication.missing_pay_publications(@publications)
        end
        if params[:status] == 'enable_to_publish'
          @publications = Publication.enable_to_publish_publications(@publications)
        end
        if params[:status] == 'paused'
          @publications = Publication.paused_publications(@publications)
        end
        if params[:status] == 'finished'
          @publications = Publication.finished_publications(@publications)
        end
      end 
    else
      #@publications = current_user.publications.where(retired_at: nil)
      @publications = current_user.publications
      @publications = Publication.not_retired_publications(@publications)
    end
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
    @publication = current_user.publications.build(publication_params)
    max = max_attachments(@publication.relevance)
    error = false
    if @publication.valid?
      @publication.init_publication
      @publication.determinate_payment
      @publication.determinate_active
      @publication.determinate_expiration
      if params[:publication_attachments]
        if params[:publication_attachments]['image'].count <= max 
            @publication.save
            params[:publication_attachments]['image'].each { |image|
            @publication.publication_attachments.create(image: image, publication_id: @publication.id)
          }
        else
          error = true
          # flash[:error] = "Por favor, seleccione como máximo: " + max.to_s + " imágenes"
        end
      else
        @publication.save
      end
      if !error 
        flash[:notice] = "La publicación fue creada con éxito."
        redirect_to @publication
      else
        flash[:error] = "Por favor, seleccione como máximo: " + max.to_s + " imágenes"
        render :new
      end
    else
      if params[:publication_attachments]
        if params[:publication_attachments]['image'].count > max
          flash[:error] = "Por favor, seleccione como máximo: " + max.to_s + " imágenes" 
        end
      end
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
    #@publication.destroy
    @publication.retire
    @publication.save
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'La publicación ha sido eliminada.' }
      format.json { head :no_content }
    end
  end

  def publicate
    set_publication
    @publication.publicate
    @publication.save
    redirect_to publications_path
  end

  def pause
    set_publication
    if @publication.pause_counter < 3
      @publication.pause
      @publication.save
      redirect_to publications_path
      flash[:notice] = "Te quedan " + @publication.remaining_days.to_s + " días, a partir de cuando reactives tu publicación"
    else
      redirect_to publications_path
      flash[:error] = "No puede volver a pausar la publicación ya que ha alcanzado el límite de 3 pausas."
    end
  end

  def unpause
    set_publication
    @publication.unpause
    @publication.save
    redirect_to publications_path
     flash[:notice] = "Te quedan " + @publication.remaining_pauses.to_s + " pausas disponibles"
  end

  def retire
    set_publication
    @publication.retire
    @publication.save
    redirect_to publications_path
    flash[:notice] = "La publicación ha sido borrada"
  end

  def pay
    set_publication
    @publication.pay
    @publication.determinate_active
    @publication.save
    redirect_to publications_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
      @publication.fetched_from_db = true
      gon.lat = @publication.latitude
      gon.lng = @publication.longitude
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:transaction_type, :property_type, :address, :latitude, :longitude, :area, :zone, :publication_date, :number_of_rooms, :price, :expenses, :age, :currency,:video_link, :relevance, :paid, :active,:expiration_date, publication_attachments_attributes: [:id, :publication_id, :image])
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
