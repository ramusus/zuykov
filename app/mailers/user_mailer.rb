# -*- coding: utf-8 -*-
class UserMailer < ActionMailer::Base
  default from: "no-reply@zuykov.ru"

  def new_trademark(user, trademark)
    @trademark = trademark
    @user = user
    mail(:to => @user.email, :subject => "Новая заявка на регистрацию товарного знака на сайте zuykov.ru")
  end

  def new_question(user, question)
    @question = question
    @user = user
    mail(:to => @user.email, :subject => "Новый вопрос на сайте zuykov.ru")
  end

end
