class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :update, :destroy]

  # GET /hotels
  # GET /hotels.json
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  # GET /hotels/1.json
  def show

  end

  # POST /hotels
  # POST /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)

    if @hotel.save
      render json: (render_to_string(partial: 'hotel', locals: { hotel: @hotel })), status: :created
    else
	puts @hotel.errors.messages
      render json: @hotel.errors.messages, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotels/1
  # PATCH/PUT /hotels/1.json
  def update
    @hotel = Hotel.find(params[:id])

    if @hotel.update(hotel_params)
      render json: (render_to_string(partial: 'hotel', locals: { hotel: @hotel })), status: :ok
    else
      render json: @hotel.errors.messages, status: :unprocessable_entity
    end
  end

  # DELETE /hotels/1
  # DELETE /hotels/1.json
  def destroy
    @hotel.destroy

    head :no_content
  end

  def search
    query = Hotel.search do
      fulltext params[:query]
    end

    @hotels = query.results
    # get 5 results maximum
    @hotels = @hotels.slice(0,5)
  end

  private

    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      if params.is_a?(String)
        return JSON.parse(params[:stripe])
      else
        params.require(:hotel).permit(:name, :address, :star_rating, :accomodation_type_id)
      end

    end
end
