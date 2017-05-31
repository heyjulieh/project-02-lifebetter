class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

#before_action :authenticate_user!

#private

	# def authenticate_user!
 # 		if user_signed_in?
 # 			super
 # 		else
 # 			redirect_to root_path if request.original_fullpath != root_path
 # 		end
	# end
def confirm_logged_in
    unless session[:user_id]
        redirect_to :root
        return false
    else
        return true
    end
end
  include SessionsHelper
end
