class Tutorial < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  include PgSearch
  pg_search_scope :search_by_title, :against => :title
  pg_search_scope :search_by_description, :against => :description
  
  mount_uploader :video, VideoUploader
end
