class ReviewsController < ApplicationController
  # def index
  #   @reviews = Review.all
  # end

  # def show
  #   @review = Review.find(params[:id])
  # end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user_id = current_user.id

    respond_to do |format|
      if @review.save
        format.html {redirect_to movie_path(@movie)}
        format.js {redirect_to movie_path(@movie)}
        # format.json { render 'movies/show', status: :created, location: @review }
      else
        format.html { redirect_to new_movie_review_path(@movie) }
        # format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @review = Review.find(params[:id])
    @movie = @review.movie.id

    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to movie_path(@movie) }
        format.js { redirect_to movie_path(@movie) }
      else
        format.html {redirect_to edit_movie_review_path(@movie, review)}
      end
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to movie_path(@movie)
  end

  private
  def review_params
    params.require(:review).permit(:body)
  end

end
