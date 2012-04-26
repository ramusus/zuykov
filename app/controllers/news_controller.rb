class NewsController < ApplicationController
  def index
    @news = News.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @news = News.find(params[:id])
    @news_prev = News.find(:first, :conditions => ["date < ?", @news.date])
    @news_next = News.find(:first, :conditions => ["date > ?", @news.date])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
