class SearchesController < ApplicationController
  def index
    @results = Tutorial.where(:public => true).search_by_title(params[:q])
    binding.pry
  end
end