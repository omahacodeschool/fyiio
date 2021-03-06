class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location

protected

def store_location
  # store last url - this is needed for post-login redirect to whatever the user last visited.
  return unless request.get? 
  if (request.path != "/users/sign_in" &&
      request.path != "/users/sign_up" &&
      request.path != "/users/password/new" &&
      request.path != "/users/password/edit" &&
      request.path != "/users/confirmation" &&
      request.path != "/companies/create/confirmation" &&
      request.path != "/companies/create" &&
      request.path != "/companyInvites/authentication" &&
      request.path != "/companyInvites/verification" &&
      request.path != "/companies/create" &&
      request.path != "/companyInvites/verification/confirmation" &&
      request.path != "/companyInvites/verification/:auth_code" &&
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath 
  end
end

def after_sign_in_path_for(resource)
  user = User.find_by_id(current_user)
  company = Company.find_by_id(user.company_id)
  session[:company_username] = company.username
  session[:previous_url] || root_path
end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :profile_image
    devise_parameter_sanitizer.for(:sign_up) << :company_id
    devise_parameter_sanitizer.for(:sign_up) << :archived
    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :profile_image
  end

end
