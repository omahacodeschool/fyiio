class Company < ActiveRecord::Base
  mount_uploader :profile_image, ProfileImageUploader
  has_many(:companyInvites)
  has_many(:users)
  has_many :tutorials, through: "users"

  def image_check
    return self.profile_image.presence || "https://aeseda.psu.edu/wp-content/themes/theme-mingle/assets/images/placeholder.jpg"
  end
    
end
