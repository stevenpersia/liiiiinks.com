class LinksController < ApplicationController
  load_and_authorize_resource
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
    @categories = Category.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # GET /links/1/edit
  def edit
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  # POST /links
  # POST /links.json
  def create
   @link = Link.new(link_params)
   @link.category_id = params[:category_id]
   respond_to do |format|
   if @link.save
      format.html { redirect_to links_url, notice: 'Lien ajouté' }
       format.json { render :show, status: :created, location: @link }
   else
       format.html { render :new }
       format.json { render json: @link.errors, status: :unprocessable_entity }
   end
  end
end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @link.category_id = params[:category_id]
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to links_url, notice: 'Lien modifié' }
        format.json { render :show, status: :ok, location: @link }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url, notice: 'Lien supprimé' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:name, :link, :category_id, :logo, :textlink)
    end
end
