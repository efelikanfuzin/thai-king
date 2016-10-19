class QuotesController < ApplicationController
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      render :show, status: :created, location: @quote
    else
      render json: @quote.errors, status: :unprocessable_entity
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:text, :author, :url)
  end
end
