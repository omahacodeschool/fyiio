class DashboardController < ApplicationController

  def invite_additional_users
    @current_user = User.find_by_id(current_user)
    @company = Company.find_by_id(@current_user.company_id)
    @invite = CompanyInvite.new
    render "add_additional_users"
  end

  def invite_additional_users_confirmation
    @current_user = User.find_by_id(current_user)
    @company = Company.find_by_id(@current_user.company_id)

    @invite = CompanyInvite.new(:auth_code => SecureRandom.base64(8), :verified => false, :company_id => @company.id, :email => params[:email])
    @invite.save
    UserMailer.company_invite(@invite).deliver_later

    render "invite_confirmation"
  end

  def view_dashboard
    @current_user = User.find_by_id(current_user)
    @company = Company.find_by_id(@current_user.company_id)
    render

  end
end