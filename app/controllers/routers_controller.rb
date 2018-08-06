class RoutersController < ApplicationController
  before_action :set_router, only: [:show, :edit, :update, :destroy]

  # GET /routers
  # GET /routers.json

  def load_routers  
    @routers_default = Gmaps4rails.build_markers(Router.all) do |plot, marker|  
      marker.lat plot.latitude  
      marker.lng plot.longitude  

      # url_alert = "redicon.png"

      # marker.picture({  
      #   "url" => url_alert,  
      #   "width" => 25,  
      #   "height" => 25  
      # })  

      marker.infowindow render_to_string(:partial => "/routers/info",   
        :locals => {:name => plot.name, :placename => plot.placename })  
    end  
  end

  def index
    load_routers 
    @routers = Router.all
  end

  # GET /routers/1
  # GET /routers/1.json
  def show
  end

  # GET /routers/new
  def new
    @router = Router.new
  end

  # GET /routers/1/edit
  def edit
  end

  # POST /routers
  # POST /routers.json
  def create
    @router = Router.new(router_params)

    respond_to do |format|
      if @router.save
        format.html { redirect_to @router, notice: 'Router was successfully created.' }
        format.json { render :show, status: :created, location: @router }
      else
        format.html { render :new }
        format.json { render json: @router.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /routers/1
  # PATCH/PUT /routers/1.json
  def update
    respond_to do |format|
      if @router.update(router_params)
        format.html { redirect_to @router, notice: 'Router was successfully updated.' }
        format.json { render :show, status: :ok, location: @router }
      else
        format.html { render :edit }
        format.json { render json: @router.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routers/1
  # DELETE /routers/1.json
  def destroy
    @router.destroy
    respond_to do |format|
      format.html { redirect_to routers_url, notice: 'Router was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_router
      @router = Router.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def router_params
      params.require(:router).permit(:name, :placename, :latitude, :longitude)
    end
end
