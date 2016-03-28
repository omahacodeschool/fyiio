class StepsController < ApplicationController

  def create
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @new_step = Step.new
    render "create"
  end

  def create_confirmation
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @new_step = Step.new(:title => params[:step][:title], :description => params[:step][:description], :draft => params[:step][:draft], :warning =>params[:step][:warning], :start_time => (params[:step][:start_time]).to_i, :end_time => (params[:step][:end_time]).to_i, :chapter_id => @chapter.id)
    @new_step.save
    redirect_to "/"
  end

  def view
    render "view"
  end

  def edit
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @edit_step = Step.find_by_id(params[:step_id])
  end

  def update_confirmation
    @update_step = Step.find_by_id(params[:step_id])
    @update_step.title = params[:step][:title] 
    @update_step.description = params[:step][:description]
    @update_step.draft = params[:step][:draft]
    @update_step.start_time = params[:step][:start_time]
    @update_step.end_time = params[:step][:end_time]
    @update_step.save
    redirect_to "/"
  end

  def delete
    @step = Step.find_by_id(params[:step_id]).destroy
    flash[:success] = "This step was successfully deleted!"
    redirect_to "/"
  end

end