class Step < ActiveRecord::Base
  belongs_to(:chapter)
  validates :description, :length => { 
    :maximum => 250,
    :too_long  => "Description cannot exceed 250 characters" 
  }
  validates_presence_of :title, :chapter_id, :start_time, :end_time
end
