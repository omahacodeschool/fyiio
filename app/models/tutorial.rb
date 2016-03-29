class Tutorial < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  has_many :steps, through: "chapters"
  belongs_to(:user)
  validates :description, :length => { 
    :maximum => 250,
    :too_long  => "Description cannot exceed 250 characters" 
  }
  validates_presence_of :title, :user_id, :category
  include PgSearch
  pg_search_scope :primary_search, :against => [:title, :description]

  mount_uploader :video, VideoUploader

  def privacy_check(user_check)
    can_view = nil

    if self.public == false
      user = User.find_by_id(self.user_id)
      if user.company_id != user_check.company_id
        can_view = false
      else
        can_view = true
      end
    else
      can_view = true
    end

    return can_view

  end

end
