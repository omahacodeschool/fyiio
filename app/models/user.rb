class User < ActiveRecord::Base
  belongs_to(:company)
  has_many(:tutorials)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :company_id

  mount_uploader :profile_image, ProfileImageUploader

end
