class Tutorial < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  belongs_to(:user)
  validates :description, :length => { 
    :maximum => 250,
    :too_long  => "Description cannot exceed 250 characters" 
  }
  include PgSearch
  pg_search_scope :search_by_title, :against => :title
  mount_uploader :video, VideoUploader

end
