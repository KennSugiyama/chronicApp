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
      format.html { render :new }
      format.json { render :new }
    end
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save

    respond_to do |format|
      format.html
      format.json
    else
      redirect_to movie_path(@review.movie)
    end
  end

  def edit
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html
      format.json
    else
      render 'edit'
    end
  end

  def update
    @review = Review.find(params[:review_id])
    @movie = @review.movie.id
    @comment = Comment.find(params[:id])


# respond to?
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

    respond_to do |format|
      format.html
      format.json
    else
      redirect_to movie_path(@movie)
    end
  end


  def comment_votes
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
