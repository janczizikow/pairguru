class CommentsController < ApplicationController
  before_action :authenticate_user!, :set_movie
  before_action :set_comment, only: :destroy

  def create
    @comment = Comment.new(comment_params)
    @comment.movie = @movie
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment added"
      redirect_to @movie
    else
      flash[:alert] = "You can only add 1 comment per movie"
      render "movies/show"
    end
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "Comment removed"
      redirect_to @movie
    else
      flash[:alert] = @comment.errors.full_messages.join(", ")
      render "movies/show"
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def comment_params
    params.require(:comment).permit(:rating, :content)
  end
end
