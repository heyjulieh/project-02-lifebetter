before_action :authenticate_user!, only: [:show]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

