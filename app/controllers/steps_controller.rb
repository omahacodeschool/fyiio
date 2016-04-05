class StepsController < ApplicationController

  def create
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @new_step = Step.new
    render "create"
  end

  def create_confirmation
    #AMY EDIT THIS ACTION
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])

    @chapter.create_many_steps(params[:chapter][:steps_attributes])
    @chapter.save_valid_steps
    @invalid_steps = @chapter.get_invalid_steps
    @valid_steps = @chapter.get_valid_steps
    @new_steps = @chapter.get_all_new_steps
    if @invalid_steps.empty?
      @chapter.set_chapter_start_and_end_time_based_on_step_times
      flash[:success] = "Steps Successfully Created!"
      redirect_to chapters_edit_path(@tutorial.id, @chapter.id)
    else 
      render "create"
    end
  end

  def edit
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @edit_step = Step.find_by_id(params[:step_id])
    @steps = @chapter.steps.order(:start_time)
    render "edit"
  end

  def edit_confirmation
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @edit_step = Step.find_by_id(params[:step_id])
    @edit_step.update(title: params[:step][:title], description: params[:step][:description], draft: params[:step][:draft], start_time: params[:step][:start_time], end_time: params[:step][:end_time])
    if @edit_step.valid?
      @edit_step.save
      flash[:success] = "Step Successfully Updated!"
      @chapter.set_chapter_start_and_end_time_based_on_step_times
      redirect_to steps_edit_path(@tutorial.id, @chapter.id, @edit_step.id)
    else
      render "edit"
    end
  end

  def view    
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @steps = @chapter.steps.order(:start_time)
    @step = Step.find_by_id(params[:step_id])
    render "view"
  end

  def delete
    @current_user = User.find_by_id(current_user)
    @tutorial = Tutorial.find_by_id(params[:tutorial_id])
    @chapter = Chapter.find_by_id(params[:chapter_id])
    @step = Step.find_by_id(params[:step_id]).destroy
    @chapter.set_chapter_start_and_end_time_based_on_step_times
    flash[:success] = "This step was successfully deleted!"
    redirect_to chapters_edit_path(@tutorial.id, @chapter.id)
  end

end