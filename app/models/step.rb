class Step < ActiveRecord::Base
  belongs_to(:chapter)
  validates :description, :length => { 
    :maximum => 250,
    :too_long  => "Description cannot exceed 250 characters" 
  }
  validates_presence_of :title, :chapter_id, :start_time, :end_time

  def video_time_conversion_for_steps
    start_time = Time.at(self.start_time).utc.strftime("%H:%M:%S")
    end_time = Time.at(self.end_time).utc.strftime("%H:%M:%S")

    return "#{start_time} - #{end_time}"
  end

  def get_draft_title_for_step
    return self.draft == true ? "DRAFT: #{self.title.upcase}" : "EDIT: #{self.title.upcase}"
  end


end
