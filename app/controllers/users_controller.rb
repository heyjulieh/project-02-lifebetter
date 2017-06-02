class UsersController < ApplicationController
  before_action :auth_user

	#before_action :confirm_logged_in

  #get '/users/', to: 'users#index', as: 'users'
  def index
    @users = User.all
  end

  #get '/users/:user_id', to: 'users#show', as: 'user'
  def show
    set_user
    @tips = @user.tips
  end

  private
  #custom method. if user is not signed in, redirect to root
  def auth_user
    redirect_to root_path unless user_signed_in?
  end

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :slug)
  end

end
