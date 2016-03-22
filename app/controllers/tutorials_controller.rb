class TutorialsController < ApplicationController
  
  def create
    render "create"
  end

  def create_confirmation
    render "edit"
  end
end
