class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to movies_path, notice: "コメントを保存しました。"
    else
      @movies = Movie.order(created_at: :desc)
      render template: "movies/index"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to movies_path, notice: "コメントを削除しました。"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :movie_id)
  end
end
