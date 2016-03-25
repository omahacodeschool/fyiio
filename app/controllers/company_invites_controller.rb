class CompanyInvitesController < ApplicationController
  def company_authentication
    render "company_authentication"
  end

  def company_verification
    render "company_verification"
  end

  def company_verification_confirmation
    user_code = CompanyInvite.find_by_auth_code(params[:auth_code])
    if user_code == nil || user_code.verified == true
      @errors = true
      render "company_verification"
    else
      company = Find_by_id(user_code.company_id)
      session[:company_id] = company .id
      user_code.delete
      redirect_to new_user_registration_path(:company_id => session[:company_id])
    end
  end

end