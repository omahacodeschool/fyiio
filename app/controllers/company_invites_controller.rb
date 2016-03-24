class CompanyInvitesController < ApplicationController

  def company_authentication
    render "company_authentication"
  end

  def company_verification
    render "company_verification"
  end

  def company_verification_confirmation
  end

end