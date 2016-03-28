class Tutorial < ActiveRecord::Base
  has_many :chapters, dependent: :destroy
  include PgSearch
  pg_search_scope :search_by_title, :against => :title
  
  mount_uploader :video, VideoUploader

  def get_all_tutorials_for_company(user_ids_arr)
    return Tutorial.where(id: user_ids_arr)
  end
end
