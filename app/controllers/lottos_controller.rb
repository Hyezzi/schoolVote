class LottosController < ApplicationController
  before_action :set_lotto, only: [:show, :edit, :update, :destroy]
 

  # GET /lottos.json
  def index
    @lotto = Lotto.last
    
  end

  # GET /lottos/1
  # GET /lottos/1.json
  def show
    $total = VoteLog.all.count
   ## 임시코드 xxx
    #for k in 0..@lotto.winnum.to_i
    #  instance_variable_set "@winner_#{k}" , Voter.where(id: $result[k]).pluck(:studentid).to_s.gsub('{"studentid"=>','').gsub('}','')
    #end   

   ##테스트 코드 xxx
    #@firstwinner = Voter.where(id: $result[0]).pluck(:studentid).to_s.gsub('{"studentid"=>','').gsub('}','')
  end

  # GET /lottos/new
  def new
    @lotto = Lotto.new
  end

  # GET /lottos/1/edit
  def edit
  end

  # POST /lottos
  # POST /lottos.json
  def create
    @lotto = Lotto.new(lotto_params)
    
    
    $winnerarray = []
    @totalNum = VoteLog.last.id
    @cnt = 0


    if @lotto.winnum.to_i > VoteLog.count
      $winnerarray.append("ERROR! 응모자 수 < 당첨자 수")
     
    
    else
      while @cnt<@lotto.winnum.to_i
        @ranNum = rand(0..@totalNum)
        @dangchumID = VoteLog.where(id: @ranNum).pluck(:studentid)
        
        #랜덤으로 뽑힌 id가 실제로도 존재하는 지 확인, 뽑힌 id가 다시 뽑히지 않았나 확인
        if VoteLog.exists?(id:@ranNum) &&  !($winnerarray.include? @dangchumID)
          $winnerarray.append(@dangchumID)
          @cnt = @cnt+1  
        end
      end
      
    end    
    

    


    respond_to do |format|
      if @lotto.save
        format.html { redirect_to @lotto, notice: 'Lotto was successfully created.' }
        format.json { render :show, status: :created, location: @lotto }
      else
        format.html { render :new }
        format.json { render json: @lotto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lottos/1
  # PATCH/PUT /lottos/1.json
  def update
    respond_to do |format|
      if @lotto.update(lotto_params)
        format.html { redirect_to @lotto, notice: 'Lotto was successfully updated.' }
        format.json { render :show, status: :ok, location: @lotto }
      else
        format.html { render :edit }
        format.json { render json: @lotto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lottos/1
  # DELETE /lottos/1.json
  def destroy
    @lotto.destroy
    respond_to do |format|
      format.html { redirect_to lottos_url, notice: 'Lotto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lotto
      @lotto = Lotto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lotto_params
      params.require(:lotto).permit(:totalnum, :winnum, :result, :firstwinner, :resultnum)
    end
end
