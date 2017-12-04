class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to @article
    else
      render :new
    end
  end

  # GET /articles/:id
  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  private

  def article_params
    params[:article].permit(:title, :content)
  end
end
