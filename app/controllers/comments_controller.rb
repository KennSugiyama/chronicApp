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

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to comments_path
  end


  def comment_votes
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
    params.require(:vote).permit(:point)
  end

end
