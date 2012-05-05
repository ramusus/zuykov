class TrademarksController < ApplicationController
  # GET /trademarks/new
  # GET /trademarks/new.json
  def new
    @trademark = Trademark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trademark }
    end
  end

  # POST /trademarks
  # POST /trademarks.json
  def create
    @trademark = Trademark.new(params[:trademark])

    respond_to do |format|
      if @trademark.save
        format.html { render action: "success" }
        format.json { render json: @trademark, status: :created, location: @trademark }
      else
        format.html { render action: "new" }
        format.json { render json: @trademark.errors, status: :unprocessable_entity }
      end
    end
  end

  def success
  end

end