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

  def sign_in
    render "sign_in"
  end

end 