class TutorialsController < ApplicationController
  
  def view
    render "create"
  end

  def test
    render "edit"
  end
end
