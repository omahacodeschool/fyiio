class SearchesController < ApplicationController
  def index
    @categories = %w(CATEGORY1 CATEGORY2 CATEGORY3 CATEGORY4 CATEGORY5)
    @tutorials = Tutorial.where(public: true, draft: false)
    @results = @tutorials.primary_search(params[:q])
  end
end