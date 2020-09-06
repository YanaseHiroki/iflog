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
    # logをすべてとってくる
    @plans = Plan.all
    @ratios = ['◎', '◎', '◎', '◎', '◎', '◎', '◎']
    @point = 100
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
    @plan = Plan.find(params[:id])
  end
  
  private

  def plan_params
    params.require(:plan).permit(
      :target,
      :trigger,
      :habit
    )
  end

end
