class Admin::GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy]

  # GET /admin/galleries
  # GET /admin/galleries.json
  def index
    @galleries = Gallery.all
  end

  # GET /admin/galleries/1
  # GET /admin/galleries/1.json
  def show
  end

  # GET /admin/galleries/new
  def new
    @gallery = Gallery.new
  end

  # GET /admin/galleries/1/edit
  def edit
  end

  # POST /admin/galleries
  # POST /admin/galleries.json
  def create
    @gallery = Gallery.new(gallery_params)

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to [:admin, @gallery], notice: 'Gallery was successfully created.' }
        format.json { render action: 'show', status: :created, location: @gallery }
      else
        format.html { render action: 'new' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/galleries/1
  # PATCH/PUT /admin/galleries/1.json
  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
        format.html { redirect_to [:admin, @gallery], notice: 'Gallery was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/galleries/1
  # DELETE /admin/galleries/1.json
  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to admin_galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallery_params
      params.require(:gallery).permit(:name, :published)
    end
end
