class UsersController < ApplicationController
  
  before_action :require_login, except: [:new, :create]
	
	def index
		@users = User.all
	end

  def new
		@user = User.new
  end

  def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id.to_s
			redirect_to posts_path
		else
			render :new
		end
	end

	def edit
		authorized?
	end

	def update
		@user = User.find(params[:id])
		
		if @user.update_attributes(user_params)
			redirect_to edit_user_path(current_user)
		else
			render 'edit'
		end
	end

	private
	
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to acceess that page!"
      redirect_to login_path
    end
  end
end
# end of controller





