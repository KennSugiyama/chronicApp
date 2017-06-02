class MoviesController < ApplicationController
  include ApplicationHelper

  def index
    if params[:genre]
      @genre = params[:genre]
      @movies = Movie.where('genre LIKE ?', "%#{@genre}%")
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @rating = @movie.votes.where(voteable_type:"Movie").average(:point).round(1,:truncate)
    p "*"*50
    p @rating
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
