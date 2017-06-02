class CommentsController < ApplicationController
  # def index
  #   @comments = Comment.all
  # end

  # def show
  #   @comment = Comment.find(params[:id])
  # end

  def new
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to movie_path(@review.movie)
  end

  def edit
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    render 'edit'
  end

  def update
    @review = Review.find(params[:review_id])
    @movie = @review.movie.id
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to movie_path(@movie)
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @movie = @review.movie.id
    @comment.destroy

    redirect_to movie_path(@movie)
  end


  def comment_votes
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
    params.require(:vote).permit(:point)
  end

end
