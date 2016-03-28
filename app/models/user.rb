class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :company_id

  mount_uploader :profile_image, ProfileImageUploader

  
  def get_all_users_for_company(company_id)
    return User.where({:company_id => company_id}).pluck(:id)
  end
end
