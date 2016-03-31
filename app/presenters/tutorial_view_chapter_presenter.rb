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

end