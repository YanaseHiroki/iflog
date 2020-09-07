class LogsController < ApplicationController
  before_action :find_plan
  before_action :find_log, only: [:edit, :update, :destroy]

  def index
    @logs = Log.all
  end

  def new
    # logをすべてとってくる
    @logs = Log.all
    @ratios = ['◎', '◎', '◎', '◎', '◎', '◎', '◎']
    @point = 66

    @log = Log.new
  end

  def create
    @log = Log.new(log_params)
    if @log.valid?
      @log.save
    else
      render :new
    end
  end

  def show
  end

  def edit
    @log = Log.find(params[:id])
    redirect_to root_path if @log.invalid?
  end
  
  def update
    if @log.update(log_params)
      redirect_to root_path
    else
      render :edit
    end
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
      plan_id: @plan.id
    )
  end

end
