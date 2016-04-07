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
  pg_search_scope :primary_search, :against => [:title, :description, :category]

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

  def get_draft_title_for_tutorial
    return self.draft == true ? "DRAFT: #{self.title.upcase}" : "EDIT: #{self.title.upcase}"
  end

def create_chapters(params)
    #@new_chapters = []
    #params.each do |key, value|
      @new_chapter = self.chapters.new(title: params[:title], description: params[:description], draft: params[:draft])
      #@new_chapters << chapter 
    end

def save_if_valid
  if @new_chapter.valid?
    @new_chapter.save
  end
end


  # def save_valid_chapter
  #   if @new_chapter.valid?
  #     @new_chapter.save
  #   else
  #   @invalid_chapters = []
  #   @valid_chapters = []
  #   @new_chapters.each do |chapter|
  #     if chapter.valid?
  #       chapter.save
  #       @valid_chapters << chapter
  #     else
  #       @invalid_chapters << chapter
  #     end
  #   end
  # end

  # def get_invalid_chapters
  #   @invalid_chapters
  # end

  # def get_valid_chapter
  #   @valid_chapters
  # end

  # def get_all_new_chapters
  #   @new_chapters
  # end
























end
