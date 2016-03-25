class SearchesController < ApplicationController
  def index
    @results = Tutorial.where(:public => true, :draft => false).search_by_title(params[:q])
  end
end