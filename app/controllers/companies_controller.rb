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
    @new_company = Company.new
    render "edit"
  end

end