class VotesController < ApplicationController

  def upvote_comment
    p "*"*60
    p params


    @comment = Comment.find(params[:comment_id])
    p "====="*60
    p @comment
    @comment.votes.create(point:1).save

     p "====="*60
    p @comment.votes
    # redirect_to(comments_path)
  end


  # # private
  def vote_params
    params.require(:vote).permit(:user)
  end
end


# upvoteComment_vote POST   /votes/:id/upvoteComment(.:format)              votes#upvoteComment

  # def create
  #   @review = Review.find(params[:review_id])
  #   @comment = @review.comments.new(comment_params)
  #   @comment.user_id = current_user.id
  #   @comment.save
  #   redirect_to movie_path(@review.movie)
  # end