class SearchesController < ApplicationController
  def title_matches
    @title_matches = @tutorials.search_by_title(params[:q])
  end

  def description_matches
    @description_matches = @tutorials.search_by_description(params[:q])
  end

  def index
    @tutorials = Tutorial.where(public: true, draft: false)
    if title_matches.empty? == false
      @results = @tutorials.search_by_title(params[:q])
    else description_matches.empty? == false
      @results = @tutorials.search_by_description(params[:q])
    end
  end
end