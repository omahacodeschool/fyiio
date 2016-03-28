class Company < ActiveRecord::Base
  mount_uploader :profile_image, ProfileImageUploader
  has_many(:companyInvites)
  has_many(:users)
  has_many :tutorials, through: "users"

  def get_all_users_for_company
    return User.where({:company_id => self.id}).pluck(:id)
  end
end
