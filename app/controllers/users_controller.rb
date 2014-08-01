class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params.merge(last_seen_at: Time.now))

    if @user.valid?
      sign_in(@user)
      redirect_to :dashboard
    else
      flash[:notice] = "Please choose a unique username and a password"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
