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

  # def search_content
  #   debugger
  #   # Still need to define by boolean public == true
  #   @q = "%#{params[:query]}%"
  #   @tutorials = Tutorial.where("title LIKE ? or description LIKE ?", @q @q).not Tutorial    
  # end

end 