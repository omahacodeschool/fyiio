class StepCollectionPresenter
  def initialize(step_object_arr)
    @steps = step_object_arr
    @counter = 0
    @steps_info_arr = []
    @main_steps_arr = []
  end

  def set_step(step)
    @step = step
  end
  
  def get_step
    @step
  end

  def empty_check
    if @steps.empty?
      get_main_steps_arr()
    else
      get_steps_ordering_array()
    end
  end

  def reset_steps_info_arr
    @steps_info_arr = []
  end

  def get_main_steps_arr()
    return @main_steps_arr
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
      "#{@step.title} - (#{@step.video_time_conversion_for_steps})"
  end

  def get_steps_ordering_array()
    @steps.each do |step|
      set_step(step)
      reset_steps_info_arr

      if step.warning?
        @step_info_arr << "WARNING!"
      else
        @counter += 1
        @steps_info_arr <<  "STEP: #{@counter} "
      end
        @steps_info_arr << content()
        @steps_info_arr << get_start_time()
        @steps_info_arr << get_end_time()
        @steps_info_arr << get_description()
        @main_steps_arr << @steps_info_arr
    end
    get_main_steps_arr()
  end

end