class UsersController < ApplicationController

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

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :slug)
  end

end
