class TutorialsController < ApplicationController
  
  def create
    @new_tutorial = Tutorial.new
    render "create"
  end

  def create_confirmation
    @user = User.find_by_id(current_user)
    @new_tutorial = Tutorial.new(title: params[:tutorial][:title], description: params[:tutorial][:description], video: params[:tutorial][:video], public: params[:tutorial][:public], draft: params[:tutorial][:draft], category: params[:tutorial][:category], user_id: @user.id)
    @new_tutorial.save
    flash[:success] = "Tutorial Created!"
    redirect_to tutorials_edit_path(@new_tutorial)
  end

  def edit
    @edit_tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapters = Chapter.where({:tutorial_id => @edit_tutorial.id}).order('id')
    render "edit"
  end

  def edit_confirmation
    @current_user = User.find_by_id(current_user)
    @edit_tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapters = @edit_tutorial.chapters.order('id')
    @edit_tutorial.update(title: params[:tutorial][:title], description: params[:tutorial][:description], public: params[:tutorial][:public], draft: params[:tutorial][:draft], category: params[:tutorial][:category])
    @edit_tutorial.save
    flash[:success] = "Tutorial Information Updated!"
    redirect_to tutorials_edit_path(@edit_tutorial.id)
  end

  def view
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapters = @tutorial.chapters.order('id')
    @counter = 0
    render "view"
  end

  def delete
    @tutorials = Tutorial.find_by_id(params[:tutorial_id]).destroy
    flash[:success] = "Tutorial successfully deleted!"
    redirect_to dashboard_path(session[:company_username])
  end

end