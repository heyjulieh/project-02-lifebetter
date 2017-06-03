class TipsController < ApplicationController


  def index
    @tips = Tip.all
  end

  def show
    set_tip
  end

  def upvote
    set_tip
    @tip.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    set_tip
    @tip.downvote_by current_user
    if @tip.get_downvotes.size > 2
      flash[:notice] = "This tip has been deleted for being downvoted too many times"
      @tip.destroy
    end
    redirect_back(fallback_location: root_path)
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

end
