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

end 