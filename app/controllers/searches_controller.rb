class SearchesController < ApplicationController
  def title_matches
    @tutorials = Tutorial.where(public: true, draft: false)
    @title_matches = @tutorials.search_by_title(params[:q])
  end

  def description_matches
    @tutorials = Tutorial.where(public: true, draft: false)
    @description_matches = @tutorials.search_by_description(params[:q])    
  end

  def index
    if title_matches.length > 0 || description_matches.length > 0
      @tutorials = Tutorial.where(public: true, draft: false)
      @results = @tutorials.search_by_title(params[:q])
    else
    end
  end
end