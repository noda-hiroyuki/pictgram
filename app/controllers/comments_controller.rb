class CommentsController < ApplicationController
  def new

    @comment = Comment.new
  end

  def create
    #ログインユーザのコメント内容を取得
    @comments = current_user.comments.new(comment_params)
    #ログインユーザのユーザ情報を取得
    @user_name = User.find_by(id: current_user.id)
    #コメント入力したユーザ名を取得
    @comments.user_name = @user_name.name
    @comments.save
    redirect_to topics_path

  end

    private
    def comment_params
      params.require(:comment).permit(:body, :topic_id)
    end
end
