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
end