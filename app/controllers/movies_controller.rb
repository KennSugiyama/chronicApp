class MoviesController < ApplicationController
  include ApplicationHelper

  def index
    movie_title = params[:title]
    request = MovieAdapter.new.search(movie_title)
    movie_title_search(request)
  end

  def new
    
  end

  def create

  end


end