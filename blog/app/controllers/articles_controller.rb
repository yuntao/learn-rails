class ArticlesController < ApplicationController

  # Basic HTTP authentication
  # Two popular alternative authentication add-ons for Rails are the Devise rails engine and the Authlogic gem
  http_basic_authenticate_with name: "user", password: "password", except: [:index, :show]

  # Standard CRUD actions order: index, show, new, edit, create, update, destroy

  def index
    @articles = Article.all
  end

  def show
    # hold reference in an instance article variable
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # render plain: params[:article].inspect

    # @article = Article.new(params[:article])
    @article = Article.new(article_params)

    # Check validation
    if @article.save
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

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # Place public methods before any private or protected methods

  private
  def article_params
    # http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    # http://weblog.rubyonrails.org/2012/3/21/strong-parameters/
    params.require(:article).permit(:title, :text)
  end
end
