class CompaniesController < ApplicationController

  def create
    @new_company = Company.new
    render "create"
  end

  def create_confirmation
    @new_company = Company.new(:username => params[:company][:username], :profile_image => params[:company][:profile_image], :name => params[:company][:name], :bio => params[:company][:bio], :address_1 => params[:company][:address_1], :address_2 => params[:company][:address_2], :city => params[:company][:city], :state => params[:company][:state], :zip => params[:company][:zip])
    @new_company.save
    session[:company_id] = @new_company.id
    session[:company_username] = @new_company.username

    redirect_to new_user_registration_path
  end

  def update_company
    @edit_company = Company.find_by_username(session[:company_username])
    @image = @edit_company.image_check
    render "edit"
  end

    def update_company_confirmation
    @edit_company = Company.find_by_username(session[:company_username])
    @edit_company.update(:name => params[:company][:name], :bio => params[:company][:bio], :address_1 => params[:company][:address_1], :address_2 => params[:company][:address_2], :city => params[:company][:city], :state => params[:company][:state], :zip => params[:company][:zip])
    redirect_to view_company_info_path
  end

  def update_company_image
    @edit_company = Company.find_by_username(session[:company_username])
    render "edit_image"
  end

  def update_company_image_confirmation
    @edit_company = Company.find_by_username(session[:company_username])
    @edit_company.update(:profile_image => params[:company][:profle_image])
    redirect_to update_company_path
  end

  def view_company_info
    @company = Company.find_by_username(session[:company_username])
    render "view_info"
  end
end