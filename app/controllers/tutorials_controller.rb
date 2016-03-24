class TutorialsController < ApplicationController
  
  def create
    @new_tutorial = Tutorial.new
    render "create"
  end

  def create_confirmation
    @new_tutorial = Tutorial.new(:title => params[:tutorial][:title], :description => params[:tutorial][:description], :video => params[:tutorial][:video], :public => params[:tutorial][:public], :draft => params[:tutorial][:draft], :category => params[:tutorial][:category])
    @new_tutorial.save
    redirect_to "/tutorials/#{@new_tutorial.id}/chapters/create"
  end

  def edit
    @edit_tutorial = Tutorial.new
    @edit_tutorial.save
  end
end
