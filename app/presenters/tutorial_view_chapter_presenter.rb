require 'tutorial_view_step_presenter'
class ChapterPresenter
  def initialize(chapter_object, chapter_index)
    @chapter = chapter_object
    @count = chapter_index += 1
  end

  def step_ordering
    ordering = {}
    counter = 0
    @chapter.steps.each do |step|
      if step.warning?
        ordering[s] = "WARNING"
      else
        counter += 1
        ordering[s] = "STEP: #{@counter}"
      end
    end
    return ordering
  end

  def chapter
    @chapter
  end

  def content
       "Chapter #{@count}: #{chapter.title} - (#{chapter.video_time_conversion_for_chapters})"
  end

  def get_description()
   return  @chapter.description
  end

  def get_start_time()
   return  @chapter.start_time
  end

  def get_end_time()
   return  @chapter.end_time
  end


end