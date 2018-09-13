class CommentsController < ApplicationController
  before_action :authenticate_user!, :set_movie
  before_action :set_comment, only: :destroy

  def create
    @comment = Comment.new(comment_params)
    @comment.movie = @movie
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment added"
    else
      flash[:alert] = "You can only add 1 comment per movie"
    end
    redirect_to @movie
  end

  def destroy
    if @comment.destroy
      flash[:notice] = "Comment removed"
    else
      flash[:alert] = @comment.errors.full_messages.join(", ")
    end
    redirect_to @movie
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
