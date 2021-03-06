class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    if params[:status] == "activated"
      render plain: params[:status].inspect
    else
      s = 1
    end
    @articles = Article.all
    @books = Book.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    ArticleTestJob.perform_later(article_params)
    @article = Article.new(article_params)
    if @article.save
      # SendMailMailer.send_mail.deliver_now
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
  def article_params
    params.require(:article).permit(:title)
  end
end
