class AccomodationTypesController < ApplicationController
  def index
    @accomodation_types = AccomodationType.all
    render json: @accomodation_types.to_json, status: :ok
  end
end
