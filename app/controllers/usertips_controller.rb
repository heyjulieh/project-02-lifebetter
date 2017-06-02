class UsertipsController < ApplicationController
  before_action :authenticate_user!
  # before_action :require_ownership

  # get '/users/:user_id/tips/new', to: 'usertips#new', as: 'new_user_tip'
  def new
    set_user
    @tip = Tip.new
  end

  # post '/users/:user_id/tips', to: 'usertips#create'
  def create
    set_user
    @tip = Tip.create(tip_params)
    if @tip.save
      @user.tips << @tip
      redirect_to user_path(@user)
      flash[:notice] = "Tip successfully saved!"
    else
      flash[:error] = @tip.errors.full.messages.join(" ")
      render :new
    end
  end

  # get '/users/:user_id/tips/:id/edit', to: 'usertips#edit', as: 'edit_user_tip'
  def edit
    set_tip
    # @tip = Tip.find params[:id]
  end

  # patch '/users/:user_id/tips/:id', to: 'usertips#update'
  def update
    set_tip
    set_user
    @tip.update_attributes(tip_params)
    flash[:notice] = "Tip successfully updated!"
    redirect_to @user
  end

  # delete '/users/:user_id/tips/:id', to: 'usertips#destroy'
  def destroy
    set_tip
    set_user
    if @user == current_user
      @tip.destroy
      redirect_to @user
      flash[:notice] = "Deleted!"
    else
      redirect_to @user
      flash[:notice] = "Sorry, you can only delete your own comments!"
    end
  end

  private

  def tip_params
    params.require(:tip).permit(:genre, :title, :content, :avatar, :slug)
  end

  def set_tip
    @tip = Tip.friendly.find(params[:id])
  end

  def set_user
    @user = User.friendly.find(params[:user_id])
  end

  def user_params
    params.require(:user).permit(:username, :slug)
  end

  def require_ownership
    if current_user.nil? || current_user.username != params[:user_id]
      flash[:notice] = "you don't have access to this page"
      redirect_to user_path(current_user)
    end
  end

end
