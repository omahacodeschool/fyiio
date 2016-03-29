class Chapter < ActiveRecord::Base
  has_many :steps, dependent: :destroy
  belongs_to(:tutorial)
  validates :description, :length => { 
    :maximum => 250,
    :too_long  => "Description cannot exceed 250 characters" 
  }
  validates_presence_of :title, :tutorial_id, :start_time, :end_time
end
