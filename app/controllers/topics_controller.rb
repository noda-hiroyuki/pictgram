class TopicsController < ApplicationController
  def index
    @topics = Topic.all.includes(:favorite_users)

    @topic_comments = Comment.includes(:topic)
    #binding.pry

    #いいね数のカウント処理
    @favorites_count = Topic.joins(:favorites).group(:topic_id).count
    #binding.pry

    #コメント数のカウント処理
    @comment_count = Topic.joins(:comments).group(:topic_id).count
    #binding.pry

    @comment = Comment.new
    #binding.pry


  end

  def new
    @topic = Topic.new
  end

  helper_method :topic_comments
  def topic_comments(id)
    @comments = Comment.where(topic_id: id).order("topic_id")
  end


  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topics_path, success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end

  include ApplicationHelper

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end
end
