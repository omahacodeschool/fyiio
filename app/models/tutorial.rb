class Tutorial < ActiveRecord::Base
  include PgSearch
  
  mount_uploader :video, VideoUploader
end
