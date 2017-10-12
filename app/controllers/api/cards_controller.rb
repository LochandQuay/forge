class Api::CardsController < ApplicationController
  def index
    if search_params
      @filters = search_params.to_h.map { |k, v| "#{k.titleize}: #{v}" }
      @cards = Card.where(search_params)
    else
      @cards = Card.all
    end 

    respond_to do |format|
      format.html
      format.json { render json: @cards.to_json }
    end
  end
  
  def show
    @card = Card.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @card.to_json }
    end
  end

  private

  def search_params
    params.permit(Card.column_names)
  end
end
