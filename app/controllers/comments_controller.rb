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

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @review = Review.find(params[:review_id])
    @movie = @review.movie
    @comment = @review.comments.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html {redirect_to movie_path(@movie)}
        format.js {redirect_to movie_path(@movie)}
      else
        format.html {redirect_to new_movie_comment_path(@review)}
      end
    end
  end

  def edit
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @review = Review.find(params[:review_id])
    @movie = @review.movie.id
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html {redirect_to movie_path(@movie)}
        format.js {redirect_to movie_path(@movie)}
      else
        format.html {redirect_to edit_review_comment_path(@movie, comment)}
      end
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
  end

end
