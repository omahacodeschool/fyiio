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
        ordering[step] = "STEP: #{counter}"
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
  
  def content
    order_check()
      "#{@step_order} #{@step.title} - (#{@step.video_time_conversion_for_steps})"
  end


end