class Company < ActiveRecord::Base
  mount_uploader :profile_image, ProfileImageUploader
end
