class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale, :set_context

  def set_context
    @news_all = News.where('of_company = False').limit(3)
    @news_company = News.where('of_company = True').limit(3)

    @header_quote = Chunk.find_by_code('header_quote')
    @header_phones = Chunk.find_by_code('header_phones')
    @left_announce = Chunk.find_by_code('left_announce')
    @left_in_process = Chunk.find_by_code('left_in_process')
    @left_clients = Chunk.find_by_code('left_clients')
    @right_social = Chunk.find_by_code('right_social')
    @membership = Chunk.find_by_code('membership')
    @footer_copyright = Chunk.find_by_code('footer_copyright')
    @footer_phones = Chunk.find_by_code('footer_phones')
    @menu = Chunk.find_by_code('menu')
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def calculator
  end

  def request
  end

end
