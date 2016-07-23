class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :current_district, :all_districts, :set_district, :has_district?

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!!current_user
  end

  def has_district?(user)
    if user.district_id != 0
      true
    end
  end

  def required_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

  def require_district
    if logged_in? and current_user.district_id == 0
      flash[:danger] = "You must set up your school district before using this site"
      redirect_to new_district_path
    end
  end

  def current_district
    current_user.district.title
  end

  def all_districts
    @districts = District.all.order('title ASC')
  end

  def set_district
    district_list = all_districts.map { |district| [district.title, district.id]}
    district_list.push ("*Create a new district")
  end


end
