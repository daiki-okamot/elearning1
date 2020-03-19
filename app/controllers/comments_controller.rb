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

  private

  def comment_params
    params.require(:comment).permit(:body, :movie_id)
  end
end
