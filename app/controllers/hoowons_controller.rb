class HoowonsController < ApplicationController
  before_action :set_hoowon, only: [:show, :edit, :update, :destroy]

  # GET /hoowons
  # GET /hoowons.json
  def index
    @hoowons = Hoowon.all
  end

  # GET /hoowons/1
  # GET /hoowons/1.json
  def show
  end

  # GET /hoowons/new
  def new
    @hoowon = Hoowon.new
  end

  # GET /hoowons/1/edit
  def edit
  end

  # POST /hoowons
  # POST /hoowons.json
  def create
    @hoowon = Hoowon.new(hoowon_params)

    respond_to do |format|
      if @hoowon.save
        format.html { redirect_to @hoowon, notice: 'Hoowon was successfully created.' }
        format.json { render :show, status: :created, location: @hoowon }
      else
        format.html { render :new }
        format.json { render json: @hoowon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hoowons/1
  # PATCH/PUT /hoowons/1.json
  def update
    respond_to do |format|
      if @hoowon.update(hoowon_params)
        format.html { redirect_to @hoowon, notice: 'Hoowon was successfully updated.' }
        format.json { render :show, status: :ok, location: @hoowon }
      else
        format.html { render :edit }
        format.json { render json: @hoowon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hoowons/1
  # DELETE /hoowons/1.json
  def destroy
    @hoowon.destroy
    respond_to do |format|
      format.html { redirect_to hoowons_url, notice: 'Hoowon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hoowon
      @hoowon = Hoowon.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hoowon_params
      params.require(:hoowon).permit(:name, :given)
    end
end
