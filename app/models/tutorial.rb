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

  def draft_check
    draft_tutorial = self.draft
    draft_chapters = self.chapters.where({draft: true}).empty?
    draft_steps = self.steps.where({draft: true}).empty?

    if draft_tutorial == true || draft_chapters == false || draft_steps == false
      return true
    else
      return false
    end
  end

  def get_privacy_notice
    return self.public == true ? "Public" : "Private"
  end

  def get_category_notice
    notice = ""
    if self.category == "1"
      notice = "CATEGORY 1"
    elsif self.category == "2"
      notice = "CATEGORY 2"
    elsif self.category == "3"
      notice = "CATEGORY 3"
    elsif self.category == "4"
      notice = "CATEGORY 4"
    elsif self.category == "5"
      notice = "CATEGORY 5"
    end

    return notice
  end
end
