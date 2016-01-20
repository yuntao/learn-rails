class ArticlesController < ApplicationController
  # Standard CRUD actions order: index, show, new, edit, create, update, destroy

  def show
    # hold reference in an instance article variable
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    # render plain: params[:article].inspect

    # @article = Article.new(params[:article])
    @article = Article.new(article_params)
    @article.save
    redirect_to @article
  end

  # Place public methods before any private or protected methods

  private
  def article_params
    # http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    # http://weblog.rubyonrails.org/2012/3/21/strong-parameters/
    params.require(:article).permit(:title, :text)
  end
end
