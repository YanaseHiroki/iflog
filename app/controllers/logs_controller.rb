class LogsController < ApplicationController
  before_action :find_plan
  before_action :find_log, only: [:edit, :update, :destroy]

  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
    # for shared/table
    require 'date'
    @day = Date.today - 6
    target = @plan.target
    @logs = Log.where(plan_id: @plan.id)
    scores = []
    7.times do |i|
      result = @logs.find_by(date: @day + i)
      if result.nil?
        scores[i] = '　'
      else
        scores[i] = result.result
      end
    end
    @scores = scores
  end
  
  
  def create
    # 記録を作成
    @log = Log.new(log_params)
    @user = User.find(current_user.id)
    # 記録を保存
    params_date =  params[:log][:date]
    params_result =  params[:log][:result]
    if @log.valid?
      @log.save
      result_table
    elsif params_date.blank? || params_result.blank?
      result_table
      render :new
    else
      @log = Log.find_by(user_id: current_user.id, plan: @plan.id, date: params_date)
      @log.update(log_params)
      result_table
    end
    # 連続日数を表示
    @days = 0
    @logs = Log.where(user_id: current_user.id, plan: @plan.id)
    # 連続で実践した日数を調べる
    @yesterday = Date.today - 1
    while @logs.find_by(date: @yesterday).nil? == false
      @yesterday -= 1
      @days += 1
    end
    # ブランクの日数を調べる
    @yesterday = Date.today - 1
    while @logs.find_by(date: @yesterday).nil?
      @yesterday -= 1
      @days -= 1
      if @yesterday < @log.date - 100
        @days = 0
        break
      end
    end
  end
  
  def result_table
    # for shared/table
    require 'date'
    @day = Date.today - 6
    target = @plan.target
    @logs = Log.where(plan_id: @plan.id)
    scores = []
    7.times do |i|
      result = @logs.find_by(date: @day + i)
      if result.nil?
        scores[i] = '　'
      else
        scores[i] = result.result
      end
    end
    @scores = scores
  end
  
  # def edit
  #   @log = Log.find_by(params[:date])
  #   # for shared/table
  #   require 'date'
  #   @day = Date.today - 6
  #   target = @plan.target
  #   @logs = Log.where(plan_id: @plan.id)
  #   scores = []
  #   7.times do |i|
  #     result = @logs.find_by(date: @day + i)
  #     if result.nil?
  #       scores[i] = '　'
  #     else
  #       scores[i] = result.result
  #     end
  #   end
  #   @scores = scores
  # end
  
  def update
    @log.update(log_params)
    redirect_to new_plan_log_path(@plan.id)
  end

  def destroy
    if @log.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def find_plan
    @plan = Plan.find(params[:plan_id])
  end
  
  def find_log
    @log = Log.find(params[:id])
  end
  
  private

  def log_params
    params.require(:log).permit(
      :date,
      :result
    ).merge(
      user_id: current_user.id,
      plan_id: @plan.id
    )
  end

end
