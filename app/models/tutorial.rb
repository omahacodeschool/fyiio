class Tutorial < ActiveRecord::Base
  mount_uploader :video, VideoUploader
end
