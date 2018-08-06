require 'json'
class VoteLogsController < ApplicationController
  before_action :set_vote_log, only: [:show, :edit, :update, :destroy]


  # GET /vote_logs
  # GET /vote_logs.json
  def index
   
    @vote_logs = if params[:studentID]
      #검색 기능.
      VoteLog.where(" #{:studentID} LIKE ? ", params[:studentID])
    else
      VoteLog.order("created_at DESC").page params[:page]
    end 
    @vote_num = VoteLog.all
    @num = @vote_num.length
    
    # @vote_logs = VoteLog.order("created_at DESC").page params[:page]
    # @vote_my = VoteLog.where(" #{:studentID} == ? ", params[:studentID])
    # puts "============="
    # puts @vote_my.name
    # puts "============="
  end

  # GET /vote_logs/1
  # GET /vote_logs/1.json
  def show
  end

  # GET /vote_logs/new
  def new
    @vote_log = VoteLog.new
  end

  # GET /vote_logs/1/edit
  def edit
  end

  # POST /vote_logs
  # POST /vote_logs.json
  def create
    @vote_log = VoteLog.new(vote_log_params)

    respond_to do |format|
      if @vote_log.save
        format.html { redirect_to @vote_log, notice: 'Vote log was successfully created.' }
        format.json { render :show, status: :created, location: @vote_log }
      else
        format.html { render :new }
        format.json { render json: @vote_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_logs/1
  # PATCH/PUT /vote_logs/1.json
  def update
    respond_to do |format|
      if @vote_log.update(vote_log_params)
        format.html { redirect_to @vote_log, notice: 'Vote log was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote_log }
      else
        format.html { render :edit }
        format.json { render json: @vote_log.errors, status: :unprocessable_entity }
      end
    end
  end

  ##고려대학교 학생인지 확인 && 이미 참여한 기록은 없는지 확인
  def checkDouble
    puts "double checking"
    @studentID = params[:studentID]
    @name = params[:name]
    puts @studentID
    puts @name

    $result = {"IsStudent" => 0, "IsFirst" => 0, "canWrite" => 0}

    #고려대학교 학생인지 확인   Thing.exists?(params[:id])
    #@resultInDB = SchoolDb.where(studentID: @studentID)
    #puts @resultInDB.pluck(:studentID)##################################################

      #학교 db 내에 입력한 학번이 존재
      if SchoolDb.exists?(:name => @name)  #학교 db 내에 입력한 학번과 이름이 일치
        $result[:IsStudent] = 1
                
        #중복확인(교내 db와 일치하는 경우에만 실행하기 위함)
        if !VoteLog.exists?(:studentID => @studentID) #응모 기록 db에 입력한 학번이 존재하는지
          $result[:IsFirst] = 1
          $result[:canWrite] = 1    
        end
      end
  
      $result = $result.to_json
      puts $result

    respond_to do |format|
      format.json {render json: $result}
    end

    #$result = $result.to_json
    #puts "json 실행" + $result
   
  end

  # DELETE /vote_logs/1
  # DELETE /vote_logs/1.json
  def destroy
    @vote_log.destroy
    respond_to do |format|
      format.html { redirect_to vote_logs_url, notice: 'Vote log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote_log
      @vote_log = VoteLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_log_params
      params.require(:vote_log).permit(:studentID, :name, :image, :password, :phoneNum)
    end
end