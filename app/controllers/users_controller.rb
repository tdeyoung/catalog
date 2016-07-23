class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]


  def show
    if @user.district_id == 0
      @user.district_id = current_district.id
    end
  end

 # GET /users
  # GET /users.json
  def index
    @users = User.order("name ASC").paginate(page: params[:page], per_page: 4)
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
  	else
  		render 'new' and return
  	end

    if @user.district_id == 0
      redirect_to new_district_path and return
    else
      redirect_to user_path(@user.id)
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

    def require_same_user
      if current_user != @user
        flash[:danger] = "You can only edit your own profile"
        redirect_to :back
      end 
    end

end
