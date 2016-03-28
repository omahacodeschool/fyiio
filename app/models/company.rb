class Company < ActiveRecord::Base
  mount_uploader :profile_image, ProfileImageUploader


  def get_all_users_for_company
    return User.where({:company_id => self.id}).pluck(:id)
  end
end
