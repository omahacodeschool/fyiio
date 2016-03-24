class Tutorial < ActiveRecord::Base
  include PgSearch
  pg_search_scope :search_by_title, :against => :title
  
  mount_uploader :video, VideoUploader
end
