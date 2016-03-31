class TutorialsController < ApplicationController
  require 'tutorial_view_step_presenter'
  require 'tutorial_view_chapter_presenter'
  
  def create
    @new_tutorial = Tutorial.new
    render "create"
  end

  def create_confirmation
    @user = User.find_by_id(current_user)
    @new_tutorial = Tutorial.new(title: params[:tutorial][:title], description: params[:tutorial][:description], video: params[:tutorial][:video], public: params[:tutorial][:public], draft: params[:tutorial][:draft], category: params[:tutorial][:category], user_id: @user.id)
    if @new_tutorial.valid?
      @new_tutorial.save
      flash[:success] = "Tutorial Created!"
      redirect_to tutorials_edit_path(@new_tutorial)
    else
      render "create"
    end
  end

  def edit
    @edit_tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapters = Chapter.where({:tutorial_id => @edit_tutorial.id}).order('id')
    render "edit"
  end

  def edit_confirmation
    @current_user = User.find_by_id(current_user)
    puts current_user
    @edit_tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapters = @edit_tutorial.chapters.order('id')
    @edit_tutorial.update(title: params[:tutorial][:title], description: params[:tutorial][:description], public: params[:tutorial][:public], draft: params[:tutorial][:draft], category: params[:tutorial][:category])
    if @edit_tutorial.valid?
      @edit_tutorial.save
      flash[:success] = "Tutorial Information Updated!"
      redirect_to tutorials_edit_path(@edit_tutorial.id)
    else
      render "edit"
    end
  end

  def view
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapters = @tutorial.chapters.order('id')
    @warning_count = 0
    access_check = @tutorial.privacy_check(@current_user)
    draft_check = @tutorial.draft_check

    if access_check == false
      render "private_tutorial"
    end

    if draft_check == true
      render "tutorial_draft"
    else
      render "view"
    end
  end

  def finished_editing_checks
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    draft_check = @tutorial.draft_check

    if draft_check == true
      redirect_to dashboard_path(session[:company_username])
    else 
      redirect_to tutorials_path(@tutorial.id)
    end
  end

  def delete
    @tutorials = Tutorial.find_by_id(params[:tutorial_id]).destroy
    flash[:success] = "Tutorial successfully deleted!"
    redirect_to dashboard_path(session[:company_username])
  end

end