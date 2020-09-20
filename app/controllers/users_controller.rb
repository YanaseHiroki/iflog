class UsersController < ApplicationController
  def show
  end
  def edit
    @user = User.find(current_user.id)
  end
  def update
    if @user.valid?
      @user.update
    else
      render :edit
    end
  end
end
