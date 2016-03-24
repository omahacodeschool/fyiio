class CompaniesController < ApplicationController

  def create
    @new_company = Company.new
    render "create"
  end

  def create_confirmation
    @new_company = Company.new
    render "edit"
  end

  def edit
    @new_company = Company.new(:profile_image => params[:companies][:profile_image], :name => params[:companies][:name], :bio => params[:companies][:bio], :address_1 => params[:companies][:address_1], :address_2 => params[:companies][:address_2], :city => params[:companies][:city], :state => params[:companies][:state], :zip => params[:companies][:zip])
    render "edit"
  end

end