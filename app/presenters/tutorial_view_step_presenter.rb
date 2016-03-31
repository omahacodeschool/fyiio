class StepPresenter
    @@counter = 0
    @@chapter = 0
  def initialize(step_object, chapter_id)
    @step = step_object
    @current_chapter = chapter_id

    if @@chapter != @current_chapter
       @@counter = 0
       @@chapter = @current_chapter
    end

  end


  def step
    @step
  end



  def content
    if self.step.warning?
      "WARNING! #{step.title} - (#{step.video_time_conversion_for_steps})"
    else
      @@counter += 1
      "Step #{@@counter}: #{step.title} - (#{step.video_time_conversion_for_steps})"
    end
  end

end