class ChaptersController < ApplicationController

  def create
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @new_chapter = Chapter.new
    render "create"
  end

  def create_confirmation
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @new_chapter = Chapter.new(:title => params[:chapter][:title], :description => params[:chapter][:description], :draft => params[:chapter][:draft], :start_time => (params[:chapter][:start_time]).to_i, :end_time => (params[:chapter][:end_time]).to_i, :tutorial_id => @tutorial.id)
    @new_chapter.save
    redirect_to "/tutorials/#{@tutorial.id}/chapters/#{@new_chapter.id}/steps/create"
  end

  def delete
    @chapter = Chapter.find_by_id(params[:chapter_id]).destroy
    flash[:success] = "Chapter successfully deleted!"
    redirect_to "/"
  end

  def edit
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @edit_chapter = Chapter.find_by_id(params[:chapter_id])
  end

  def update_confirmation
    @update_chapter = Chapter.find_by_id(params[:chapter_id])
    @update_chapter.title = params[:chapter][:title] 
    @update_chapter.description = params[:chapter][:description]
    @update_chapter.draft = params[:chapter][:draft]
    @update_chapter.start_time = params[:chapter][:start_time]
    @update_chapter.end_time = params[:chapter][:end_time]
    @update_chapter.save
    redirect_to "/"
  end

  def view
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @steps = Step.where({chapter_id: @chapter.id}).order('id')
    @counter = 0
    render "view"
  end

end