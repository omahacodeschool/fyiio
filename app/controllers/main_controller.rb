class MainController < ApplicationController
  
  def home
    render "home"
  end

  def about
    render "about"
  end

  def discover
    render "discover"
  end

  def account_creation
    @user = User.new
    render "devise/registrations/new"
  end

  def account_creation_confirmation


  end

end 