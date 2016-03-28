class Tutorial < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  belongs_to(:user)
  include PgSearch
  pg_search_scope :search_by_title, :against => :title
  
  mount_uploader :video, VideoUploader

end
