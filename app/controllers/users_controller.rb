class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]


  def show
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

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated succesfully"
      redirect_to users_path
    else
      render 'edit'
  end
end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :district_id, :admin, :password, :password_confirmation)
  	end

    def set_user
      @user = User.find(params[:id])
    end
end
