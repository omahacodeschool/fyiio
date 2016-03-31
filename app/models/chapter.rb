class Chapter < ActiveRecord::Base
  belongs_to(:tutorial)
  has_many :steps, dependent: :destroy
  validates :description, :length => { 
    :maximum => 250,
    :too_long  => "Description cannot exceed 250 characters" 
  }
  validates_presence_of :title, :tutorial_id

  def video_time_conversion_for_chapters
    start_time = Time.at(self.start_time).utc.strftime("%H:%M:%S")
    end_time = Time.at(self.end_time).utc.strftime("%H:%M:%S")

    return "#{start_time} - #{end_time}"
  end

  def get_draft_title_for_chapter
    return self.draft == true ? "DRAFT: #{self.title.upcase}" : "EDIT: #{self.title.upcase}"
  end

   def get_start_time_step_array_for_chapter
     start_times = self.steps.pluck(:start_time)
    return start_times.empty? ? 0 : start_times.min
  end

  def get_end_time_step_array_for_chapter
     end_times = self.steps.pluck(:end_time)
    return end_times.empty? ? 0 : end_times.max
  end

  def set_chapter_start_and_end_time_based_on_step_times
    starts = get_start_time_step_array_for_chapter
    ends = get_end_time_step_array_for_chapter
    self.update(start_time: starts, end_time: ends)
    self.save
  end
end

