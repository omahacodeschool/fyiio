class CompaniesController < ApplicationController

  def create
    @new_company = Company.new
    render "create"
  end

  def create_confirmation
    @new_company = Company.new
    render "/users/create_account"
  end

  def edit
    @new_company = Company.new(:profile_image => params[:companies][:profile_image], :name => params[:companies][:name], :bio => params[:companies][:bio], :address_1 => params[:companies][:address_1], :address_2 => params[:companies][:address_2], :city => params[:companies][:city], :state => params[:companies][:state], :zip => params[:companies][:zip])
    render "edit"
  end

  def company_authentication
    render "company_authentication"
  end

  def company_verification
    render "company_verification"
  end

  def company_verification_confirmation
  end

end