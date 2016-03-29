class Chapter < ActiveRecord::Base
  belongs_to(:tutorial)
  has_many :steps, dependent: :destroy
  validates :description, :length => { 
    :maximum => 250,
    :too_long  => "Description cannot exceed 250 characters" 
  }
  validates_presence_of :title, :tutorial_id, :start_time, :end_time
end
