class CompaniesController < ApplicationController
  def create
    @new_company = Company.new
    render "create"
  end

  def create_confirmation
    @new_company = Company.new(username: params[:company][:username], profile_image: params[:company][:profile_image], name: params[:company][:name], bio: params[:company][:bio], address_1: params[:company][:address_1], address_2: params[:company][:address_2], city: params[:company][:city], state: params[:company][:state], zip: params[:company][:zip])
    if @new_company.valid?
      @new_company.save
      session[:company_id] = @new_company.id
      session[:company_username] = @new_company.username
      redirect_to new_user_registration_path
    else
      render "create"
    end
  end

  def edit_company
    @current_user = User.find_by_id(current_user)
    @edit_company = Company.find_by_username(session[:company_username])
    render "edit"
  end

    def edit_company_confirmation
    @current_user = User.find_by_id(current_user)
    @edit_company = Company.find_by_username(session[:company_username])
    @edit_company.update(name: params[:company][:name], bio: params[:company][:bio], address_1: params[:company][:address_1], address_2: params[:company][:address_2], city: params[:company][:city], state: params[:company][:state], zip: params[:company][:zip])
    if @edit_company.valid?
       @edit_company.save
       redirect_to view_company_info_path
    else
      render "edit"
    end
  end

  def edit_company_image
    @current_user = User.find_by_id(current_user)
    @edit_company = Company.find_by_username(session[:company_username])
    render "edit_image"
  end

  def edit_company_image_confirmation
    @current_user = User.find_by_id(current_user)
    @edit_company = Company.find_by_username(session[:company_username])
    @edit_company.update(:profile_image => params[:company][:profle_image])
    redirect_to edit_company_path
  end

  def view_company_info
    @current_user = User.find_by_id(current_user)
    @company = Company.find_by_username(session[:company_username])
    render "view_info"
  end
end