class StepPresenter
  def initialize(step_object)
    @step = step_object
  end

  def step
    @step
  end

  def content
    if self.step.warning?
      "WARNING! #{step.title} - (#{step.video_time_conversion_for_steps})"
    else
      "Step #{step_number}: #{step.title} - (#{step.video_time_conversion_for_steps})"
    end
  end

  def step_number
    # step_index + 1 - @warning_count
    "NUMBER"
  end
end