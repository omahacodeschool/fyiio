class SearchesController < ApplicationController
  def index
    @tutorials = Tutorial.where(public: true, draft: false)
    @results = @tutorials.primary_search(params[:q])
  end
end