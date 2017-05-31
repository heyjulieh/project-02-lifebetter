class UsertipsController < ApplicationController

  # get '/users/:user_id/tips/new', to: 'usertips#new', as: 'new_user_tip'
  def new
    @user = User.find params[:user_id]
    @tip = Tip.new
  end

  # post '/users/:user_id/tips', to: 'usertips#create'
  def create
    @user = User.find params[:user_id]
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
    @tip = Tip.find params[:id]
  end

  # patch '/users/:user_id/tips/:id', to: 'usertips#update'
  def update
    user = User.find params[:user_id]
    tip = user.tips.find params[:id]
    tip.update_attributes(tip_params)
    flash[:notice] = "Tip successfully updated!"
    redirect_to user_path(user)
  end

  # delete '/users/:user_id/tips/:id', to: 'usertips#destroy'
  def destroy
    user = User.find params[:user_id]
    tip = user.tips.find params[:id]
    # tip = user.tips.find params[:id]
    tip.destroy
    redirect_to user_path(user)
    flash[:notice] = "Deleted!"
  end

  private

  def tip_params
    params.require(:tip).permit(:genre, :title, :content)
  end

  # below routes are defined, but i don't know if we need them (-jane)
  # get '/users/:user_id/tips/:id', to: 'usertips#show', as: 'user_tip'
  # get '/users/:user_id/tips', to: 'usertips#index', as: 'user_tips'

end
