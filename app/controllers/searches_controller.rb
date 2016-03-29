class SearchesController < ApplicationController
  def index
    @tutorials = Tutorial.where(public: true, draft: false)
    # @results = @tutorials.search_by_title(params[:q])
    @results = @tutorials.where("title LIKE ? or description LIKE ?", "%#{:q}%", "%#{:q}%")
  end
end