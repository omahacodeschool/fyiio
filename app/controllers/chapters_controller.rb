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
    render "edit"
  end
end