class PlansController < ApplicationController
  before_action :find_plan, only: [:show, :edit, :update, :destroy]

  def index
    @plans = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    require 'date'
    @day = Date.today - 6
    target = @plan.target
    @logs = Log.where(plan_id: params[:id])
    scores = []
    7.times do |i|
      result = @logs.find_by(date: Date.today - i)
      if result.nil?
        scores[i] = 0
      else
        scores[i] = 100 * result.result / target
      end
      scores[i] = 100 if scores[i] > 100
    end
    @scores = scores.reverse
  end

  def edit
    @plan = Plan.find(params[:id])
    redirect_to root_path if @plan.invalid?
  end
  
  def update
    if @plan.update(plan_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @plan.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  def find_plan
    @plan = Plan.find_by_id(params[:id])
    redirect_to root_path if @plan.nil?
  end
  
  private
  
  def plan_params
    params.require(:plan).permit(
      :target,
      :trigger,
      :habit
    ).merge(
      user_id: current_user.id
    )
  end

end
