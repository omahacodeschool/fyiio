class Company < ActiveRecord::Base
  mount_uploader :profile_image, ProfileImageUploader
  has_many(:companyInvites)
  has_many(:users)
  has_many :tutorials, through: "users"
  validates :bio, :length => { :maximum => 250 }
  validates_presence_of :name, :username, :address_1, :city, :state, :zip
  validates_format_of :username, with: /\A[-a-z0-9]+\Z/ 
  validates :username, uniqueness: true


  def image_check
    return self.profile_image.presence || "https://aeseda.psu.edu/wp-content/themes/theme-mingle/assets/images/placeholder.jpg"
  end
    
end
