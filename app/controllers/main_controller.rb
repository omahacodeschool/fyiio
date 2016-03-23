class MainController < ApplicationController
  
  def home
    render "home"

  def about
    render "about"

  def discover
    render "discover"
  end

  def sign_in
    render "sign_in"
  end

end 