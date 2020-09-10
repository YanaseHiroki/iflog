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
        scores[i] = ''
      else
        scores[i] = result.result
      end
    end
    @scores = scores
  end
  
  
  def create
    # 記録を作成
    @log = Log.new(log_params)
    
    # for shared/table
    require 'date'
    @day = Date.today - 6
    target = @plan.target
    @logs = Log.where(plan_id: @plan.id)
    scores = []
    7.times do |i|
      result = @logs.find_by(date: @day + i)
      if result.nil?
        scores[i] = ''
      else
        scores[i] = result.result
      end
    end
    @scores = scores
    # 連続日数を表示
    @days = 0
    @yesterday = @log.date - 1
    while Log.find_by(date: @yesterday).nil?
      @yesterday -= 1
      @days -= 1
      if @yesterday < @log.date - 100
        @days = 0
        break
      end
    end
    @yesterday = Date.today - 1
    while Log.find_by(date: @yesterday).nil? == false
      @yesterday -= 1
      @days += 1
    end
    @user = User.find_by_id(current_user.id)
    # 記録を保存
    if @log.valid?
      @log.save
    else
      render :edit
    end
  end
  
  def show
  end
  
  def edit

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
        scores[i] = ''
      else
        scores[i] = result.result
      end
    end
    @scores = scores
  end
  
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
