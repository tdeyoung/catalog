class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end

 # GET /users
  # GET /users.json
  def index
    @users = User.all
  end
  
  def new
  	@user = User.new
  end

  def edit
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Your account has been created succesfully"
      session[:user_id] = @user.id
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
