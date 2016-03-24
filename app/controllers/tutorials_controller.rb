class TutorialsController < ApplicationController
  
  def create
    @new_tutorial = Tutorial.new
    render "create"
  end

  def create_confirmation
    @user = User.find_by_id(current_user)
    @new_tutorial = Tutorial.new(:title => params[:tutorial][:title], :description => params[:tutorial][:description], :video => params[:tutorial][:video], :public => params[:tutorial][:public], :draft => params[:tutorial][:draft], :category => params[:tutorial][:category], :user_id => @user.id)
    @new_tutorial.save
    redirect_to "/tutorials/#{@new_tutorial.id}/chapters/create"
  end

  def edit
    @edit_tutorial = Tutorial.find_by_id(params[:tutorial_id])
    render "edit"

    @edit_tutorial.save
  end

  # def update_confirmation
  #   @edit_tutorial = Tutorial.find_by_id(params[:tutorial_id])
  #   @edit_tutorial.save
  #   redirect_to "/about"
  # end
end
