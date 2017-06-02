class VotesController < ApplicationController

  def upvote_comment
    @comment = Comment.find(params[:comment_id])
    @vote = @comment.votes.new(point:1)
    @vote.user_id = current_user.id
    @vote.save
    @movie = @comment.review.movie
    redirect_to(movie_path(@movie))
  end

  def downvote_comment
    @comment = Comment.find(params[:comment_id])
    @vote = @comment.votes.new(point:-1)
    @vote.user_id = current_user.id
    @vote.save
    @movie = @comment.review.movie
    redirect_to(movie_path(@movie))
  end

  def upvote_review
    @review = Review.find(params[:review_id])
    @vote = @review.votes.new(point:1)
    @vote.user_id = current_user.id
    @vote.save
    @movie = @review.movie
    redirect_to(movie_path(@movie))
  end

  def downvote_review
    @review = Review.find(params[:review_id])
    @vote = @review.votes.new(point:-1)
    @vote.user_id = current_user.id
    @vote.save
    @movie = @review.movie
    redirect_to(movie_path(@movie))
  end


  private
  def vote_params
    params.require(:vote).permit(:user)
  end
end
