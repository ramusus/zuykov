class TrademarksController < ApplicationController
  # GET /trademarks/new
  def new
    @trademark = Trademark.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # POST /trademarks
  def create
    @trademark = Trademark.new(params[:trademark])

    respond_to do |format|
      if @trademark.save
        User.emailable.each do |user|
          UserMailer.new_trademark(user, @trademark, request).deliver
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