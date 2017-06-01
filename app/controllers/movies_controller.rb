class MoviesController < ApplicationController
  include ApplicationHelper

  def index
    
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    movie_title = params[:title]
    request = MovieAdapter.new.search(movie_title)
    @movie = movie_title_search(request)
    redirect_to movie_path(@movie)
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :genre, :year, :actors, :directors)
  end

end