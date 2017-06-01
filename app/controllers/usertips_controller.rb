class UsertipsController < ApplicationController

  # get '/users/:user_id/tips/new', to: 'usertips#new', as: 'new_user_tip'
  def new
    set_user
    @tip = Tip.new
  end

  # get '/users/:user_id/tips/:id', to: 'usertips#show', as: 'user_tip'
  def show
    set_tip
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
       # add flash <% %> into template!
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
    @tip.destroy
    redirect_to @user
    flash[:notice] = "Deleted!"
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

  # below routes are defined, but i don't know if we need them (-jane)
  # get '/users/:user_id/tips', to: 'usertips#index', as: 'user_tips'

end
