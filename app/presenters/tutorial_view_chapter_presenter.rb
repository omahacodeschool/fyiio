class ChapterPresenter
  def initialize(chapter_object)
    @chapter = chapter_object
  end

  def chapter
    @chapter
  end

  def content
      "Chapter #{chapter_number}: #{chapter.title} - (#{chapter.video_time_conversion_for_chapters})"
  end

  def chapter_number
    # step_index + 1 - @warning_count
    "NUMBER"
  end
end