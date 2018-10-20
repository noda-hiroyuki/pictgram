class CommentsController < ApplicationController
  def new

    @comment = Comment.new
  end

  def create
    @comments = current_user.comments.new(comment_params)
    @user_name = User.find_by(id: current_user.id)
    @comments.user_name = @user_name.name
    @comments.save
    redirect_to topics_path

  end

    private
    def comment_params
      params.require(:comment).permit(:body, :topic_id)
    end
end
