class SearchesController < ApplicationController
  def index
    @results = Tutorial.search_by_title(params[:q])
    binding.pry
  end
end