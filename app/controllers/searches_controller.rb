class SearchesController < ApplicationController
  def index
    @results = Tutorial.where(:public => true, :draft => false).search_by_title(params[:q]) || Tutorial.where(:public => true, :draft => false).search_by_description
  end
end