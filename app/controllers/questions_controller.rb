class QuestionsController < ApplicationController
  # GET /questions/new
  def new
    @question = Question.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /questions
  def create
    @question = Question.new(params[:question])

    respond_to do |format|
      if @question.save
        for user in User.emailable
          UserMailer.new_question(user, @question).deliver
        end
        format.html { render action: "success" }
      else
        format.html { render action: "new" }
      end
    end
  end

  def success
  end

end