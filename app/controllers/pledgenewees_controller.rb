class PledgeneweesController < ApplicationController
  before_action :set_pledgenewee, only: [:show, :edit, :update, :destroy]

  # GET /pledgenewees
  # GET /pledgenewees.json
  def index
    @pledgenewees = Pledgenewee.all
  end

  # GET /pledgenewees/1
  # GET /pledgenewees/1.json
  def show
  end

  # GET /pledgenewees/new
  def new
    @pledgenewee = Pledgenewee.new
  end

  # GET /pledgenewees/1/edit
  def edit
  end

  # POST /pledgenewees
  # POST /pledgenewees.json
  def create
    @pledgenewee = Pledgenewee.new(pledgenewee_params)

    respond_to do |format|
      if @pledgenewee.save
        format.html { redirect_to @pledgenewee, notice: 'Pledgenewee was successfully created.' }
        format.json { render :show, status: :created, location: @pledgenewee }
      else
        format.html { render :new }
        format.json { render json: @pledgenewee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pledgenewees/1
  # PATCH/PUT /pledgenewees/1.json
  def update
    respond_to do |format|
      if @pledgenewee.update(pledgenewee_params)
        format.html { redirect_to @pledgenewee, notice: 'Pledgenewee was successfully updated.' }
        format.json { render :show, status: :ok, location: @pledgenewee }
      else
        format.html { render :edit }
        format.json { render json: @pledgenewee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledgenewees/1
  # DELETE /pledgenewees/1.json
  def destroy
    @pledgenewee.destroy
    respond_to do |format|
      format.html { redirect_to pledgenewees_url, notice: 'Pledgenewee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pledgenewee
      @pledgenewee = Pledgenewee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pledgenewee_params
      params.require(:pledgenewee).permit(:name, :title, :content, :title2, :content2, :title3, :content3, :image, :image2)
    end
end
