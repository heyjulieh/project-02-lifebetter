class TipsController < ApplicationController

  # def new
  #   @user = User.find params[:user_id]
  #   @tip = Tip.new
  # end

  def show
    set_tip
  end

  private

  def tip_params
    params.require(:tip).permit(:genre, :title, :content, :avatar, :slug)
  end

  def set_tip
    @tip = Tip.friendly.find(params[:id])
  end

end
