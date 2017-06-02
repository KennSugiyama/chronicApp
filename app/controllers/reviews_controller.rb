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
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    render 'edit'
  end

  def update
    @review = Review.find(params[:id])
    @movie = @review.movie.id

    if @review.update(review_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
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
