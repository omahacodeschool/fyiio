require 'tutorial_view_step_presenter'
class ChapterPresenter
  def initialize(chapter_object, chapter_index)
    @chapter = chapter_object
    @count = chapter_index += 1
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