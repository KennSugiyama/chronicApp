class MoviesController < ApplicationController
  include ApplicationHelper

  def index
    if params[:genre]
      @genre = params[:genre]
      @movies = Movie.where('genre LIKE ?', "%#{@genre}%")
    elsif params[:rating]
      order = params[:rating]
      if order == "High"
        @movies = Movie.all.sort_by{|movie| movie.votes.average(:point)}.reverse
      else
        @movies = Movie.all.sort_by{|movie| movie.votes.average(:point)}
      end
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    if @movie.votes.any?
      @rating = @movie.votes.where(voteable_type:"Movie").average(:point).round(1,:truncate)
    end
  end

  def search
      movie_title = params[:title]
      request = MovieAdapter.new.search(movie_title)
    if request["Response"] == "True"
      @movie = movie_title_search(request)
      redirect_to movie_path(@movie)
    else
      @error = "Incorrect spelling of movie title!"
      render 'application/index'
    end
  end




  private

  def movie_params
    params.require(:movie).permit(:title, :genre, :year, :actors, :directors)
  end

end
