def article_href(article)
  return "/articles/#{article.id}"
end

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end


  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if (@article.save)
      path = article_href(@article)
      redirect_to path
    else 
      render :new, status: :unprocessable_entity
    end
  end


  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])

    if (@article.update(article_params))
      path = article_href(@article)
      redirect_to path
    else 
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  
end
