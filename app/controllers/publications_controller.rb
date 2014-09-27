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
    @publication = current_user.publications.new(publication_params)
    set_relevance(current_user)
    respond_to do |format|
      if @publication.save
        if params[:publication_attachments]
          params[:publication_attachments]['image'].each do |a|
            @publication_attachment = 
              @publication.publication_attachments.create!(:image => a, :publication_id => @publication.id)
          end
        end
        format.html { redirect_to @publication, notice: 'La publicación fue creada con éxito.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: 'La publicación fue actualizada con éxito.' }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: 'La publicación fue creada con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publication_params
      params.require(:publication).permit(:transaction_type, :property_type, :address, :area, :zone, :publication_date, :number_of_rooms, :price, :expenses, :age, :phone, :currency, publication_attachments_attributes: [:id, :publication_id, :image])
    end

    def set_relevance(user)
      if user.account_type == "Free"
        @publication.relevance = 1
      elsif user.account_type == "Basic"
        @publication.relevance = 2
      elsif user.account_type == "Premium"
        @publication.relevance = 3
      end
    end
end
