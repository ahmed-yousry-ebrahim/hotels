class AccomodationType < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :all, "/accomodation_types"

end