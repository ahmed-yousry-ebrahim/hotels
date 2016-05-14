class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  # GET /hotels
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1
  def show
  end

  # GET /hotels/new
  def new
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels
  def create
    has_error = false
    begin
      @hotel = Hotel.create(:hotel => hotel_params)
    rescue Exception => exception
      has_error = true
      json_errors = exception.result.to_json
      @errors = JSON.parse(json_errors)

    end

    unless has_error
      redirect_to hotel_path(@hotel.id), notice: 'Hotel was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /hotels/1
  def update
    has_error = false
    begin
      @hotel.hotel = hotel_params
      @hotel = @hotel.save
    rescue Exception => exception
      has_error = true
      json_errors = exception.result.to_json
      @errors = JSON.parse(json_errors)

    end

    unless has_error
      redirect_to hotel_path(@hotel.id), notice: 'Hotel was successfully updated.'
    else
      render :edit
    end

  end

  # DELETE /hotels/1
  def destroy
    @hotel.destroy
    redirect_to hotels_url, notice: 'Hotel was successfully deleted.'
  end

  def search
    search_response = HTTParty.get(Rails.application.config.api_server_url+"/hotels/search.json?query="+params[:query])
    response = []
    if search_response.length
      search_response.each do |hotel|
        response << { value: hotel["name"]+"<br/>"+hotel["address"], data: hotel["id"]  }
      end
    end
    render json: {:suggestions => response}
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hotel_params
      params.permit(:name, :address, :star_rating, :accomodation_type_id)
    end
end
