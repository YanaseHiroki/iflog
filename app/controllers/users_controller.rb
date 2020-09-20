class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :rename, :update]

  def show
  end

  def edit
  end

  def rename
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(id: current_user.id)
    else
      redirect_to request.referer
    end
  end
end

def find_user
  @user = User.find_by_id(current_user.id)
  redirect_to root_path if @user.nil?
end

private

def user_params
  params.require(:user).permit(
    :name,
    :image,
    :email,
    :password
  )
end