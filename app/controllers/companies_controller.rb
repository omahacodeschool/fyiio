class CompaniesController < ApplicationController

  def create
    @new_company = Company.new
    render "create"
  end

  def create_confirmation
    @new_company = Company.new(:profile_image => params[:company][:profile_image], :name => params[:company][:name], :bio => params[:company][:bio], :address_1 => params[:company][:address_1], :address_2 => params[:company][:address_2], :city => params[:company][:city], :state => params[:company][:state], :zip => params[:company][:zip])
    @new_company.save

    redirect_to new_user_registration_path(:company_id => @new_company.id)
  end


end