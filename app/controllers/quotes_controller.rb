class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
      json_response(@quotes)
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
      @quote = Quote.find(params[:id])
      json_response(@quote)
    end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
      @quote = Quote.create(quote_params)
      json_response(@quote)
    end
  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
      @quote = Quote.find(params[:id])
      @quote.update(quote_params)
    end
  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
      @quote = Quote.find(params[:id])
      @quote.destroy
      render status: 200, json: {
        message: "Your quote has succesfully been deleted"
      }
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

  private
    def json_response(object)
      render json: object, status: :ok
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:author, :content)
    end
end
