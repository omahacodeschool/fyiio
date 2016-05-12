require 'tutorial_view_chapter_presenter'

class StepPresenter
  def initialize(step, chapter)
    @step = step
    @step_order = nil
    @chapter = chapter
  end

  def step_ordering()
    ordering = {}
    counter = 0
    @chapter.steps.order(:start_time).each do |step|
      if step.warning?
        ordering[step] = "WARNING"
      else
        counter += 1
        ordering[step] = "STEP #{counter}:"
      end
    end
    return ordering
  end

  def order_check
    order = step_ordering()
    order.each do |key, value|
      if @step == key
        @step_order = value
      end
    end
  end


  def get_start_time()
      @step.start_time
  end

  def get_end_time()
      @step.end_time
  end

  def get_description()
    @step.description
  end

  def get_title()
    @step.title
  end

  def get_step_number()
    order_check()
    @step_order
  end
  
  def content
    order_check()
      "#{@step_order} #{@step.title} - (#{@step.video_time_conversion_for_steps})"
  end

  # TODO Figure out how to prevent chapter length from being shorter than the sum of alls steps. 
  # This is currently returning a number of seconds left in video after that step is complete. TODO use that data (or modify it) to display a progress bar for user. Consider using this data to update a progress bar when a user clicks to go to a next step and/or hits a timestamp on a video.

  def get_percentage_left_in_chapter
    chapter_length = (@chapter.end_time - @chapter.start_time)
    time_left = (chapter_length - @step.end_time)
      #if chapter_length != 0.0
       # percentage_left = (time_left/chapter_length)
      #else
       # percentage_left = 0
      #end
    return time_left
  end




end