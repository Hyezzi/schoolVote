class PledgeintrosController < ApplicationController
  before_action :set_pledgeintro, only: [:show, :edit, :update, :destroy]

  # GET /pledgeintros
  # GET /pledgeintros.json
  def index
    @pledgeintros = Pledgeintro.all
  end

  # GET /pledgeintros/1
  # GET /pledgeintros/1.json
  def show
  end

  # GET /pledgeintros/new
  def new
    @pledgeintro = Pledgeintro.new
  end

  # GET /pledgeintros/1/edit
  def edit
  end

  # POST /pledgeintros
  # POST /pledgeintros.json
  def create
    @pledgeintro = Pledgeintro.new(pledgeintro_params)

    respond_to do |format|
      if @pledgeintro.save
        format.html { redirect_to @pledgeintro, notice: 'Pledgeintro was successfully created.' }
        format.json { render :show, status: :created, location: @pledgeintro }
      else
        format.html { render :new }
        format.json { render json: @pledgeintro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pledgeintros/1
  # PATCH/PUT /pledgeintros/1.json
  def update
    respond_to do |format|
      if @pledgeintro.update(pledgeintro_params)
        format.html { redirect_to @pledgeintro, notice: 'Pledgeintro was successfully updated.' }
        format.json { render :show, status: :ok, location: @pledgeintro }
      else
        format.html { render :edit }
        format.json { render json: @pledgeintro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pledgeintros/1
  # DELETE /pledgeintros/1.json
  def destroy
    @pledgeintro.destroy
    respond_to do |format|
      format.html { redirect_to pledgeintros_url, notice: 'Pledgeintro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pledgeintro
      @pledgeintro = Pledgeintro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pledgeintro_params
      params.require(:pledgeintro).permit(:title, :content, :content2, :image)
    end
end
