class ChaptersController < ApplicationController

  def create
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @new_chapter = Chapter.new
    render "create"
  end

  def create_confirmation
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @new_chapter = Chapter.new(title: params[:chapter][:title], description: params[:chapter][:description], draft: params[:chapter][:draft], start_time: (params[:chapter][:start_time]).to_i, end_time: (params[:chapter][:end_time]).to_i, tutorial_id: @tutorial.id)
    @new_chapter.save
    flash[:success] = "Chapter Created!"
    redirect_to chapters_edit_path(@tutorial.id, @new_chapter.id)
  end

  def edit
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @edit_chapter = Chapter.find_by_id(params[:chapter_id])
    @steps = Step.where({chapter_id: @edit_chapter.id}).order('id')
    render "edit"
  end

  def edit_confirmation
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @edit_chapter = Chapter.find_by_id(params[:chapter_id])
    @edit_chapter.update(title: params[:chapter][:title], description: params[:chapter][:description], draft: params[:chapter][:draft], start_time: params[:chapter][:start_time], end_time: params[:chapter][:end_time])
    flash[:success] = "Chapter Successfully Updated!"
    @edit_chapter.save
    redirect_to chapters_edit_path(@tutorial.id, @edit_chapter.id)
  end

  def delete
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id]).destroy
    flash[:success] = "Chapter successfully deleted!"
    redirect_to tutorials_edit_path(@tutorial.id)
  end

  def view
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @steps = Step.where({chapter_id: @chapter.id}).order('id')
    @counter = 0
    render "view"
  end

end