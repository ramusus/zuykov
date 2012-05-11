# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale, :set_context

  def set_context
    @news_all = News.where('of_company = False').limit(3)
    @news_company = News.where('of_company = True').limit(3)

    ['header_quote','header_phones','left_announce','left_in_process','left_clients','right_social','membership','footer_copyright','footer_phones','menu'].each do |var_name|
      chunk = Chunk.find_by_code(var_name)
      if chunk and chunk.visible
        chunk = chunk.content.html_safe
      else
        chunk = ''
      end
      self.instance_variable_set('@' + var_name, chunk)
    end

  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def calculator_form
  end

end