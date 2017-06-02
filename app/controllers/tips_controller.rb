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
  #redirect_to :back
end  

def downvote
  set_tip
  @tip.downvote_by current_user
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
