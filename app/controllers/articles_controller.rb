class ArticlesController < ApplicationController
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
