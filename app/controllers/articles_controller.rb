class ArticlesController < ApplicationController
  # Method used for listing all the articles created.
  def index
    @articles = current_user.articles
  end

  # Method used for displaying individual articles.
  def show
    @article = Article.find(params[:id])
  end

  # Method used for starting a new article.
  def new
    @article = Article.new
  end

  # Method used for editing existing articles
  def edit
    @article = Article.find(params[:id])
  end

  # Method used for creating articles.
  def create
    @article = Article.new(article_params) do |r|
    r.user_id = current_user.id
  end

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # Method used for updating the edited articles.
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # Method used for DELETING the articles.
  def destroy
   @article = Article.find(params[:id])
   @article.destroy

   redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:article_text)
    params.require(:article).permit(:article_title)
  end
end
