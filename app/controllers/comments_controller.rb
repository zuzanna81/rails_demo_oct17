class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    comment = @article.comments.new(comments_params)
    if comment.save
      flash[:notice] = "Comment was successfully created."
      redirect_to article_path(@article)
    end
  end

  private

  def comments_params
    params[:comment].permit(:body)
  end
end
