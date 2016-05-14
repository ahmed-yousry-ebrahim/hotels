class Hotel < ActiveRestClient::Base
  include ActiveAttr::BasicModel
  base_url Rails.application.config.api_server_url

  get :all, "/hotels"
  get :find, "/hotels/:id"
  put :save, "/hotels/:id"
  post :create, "/hotels"
  delete :destroy, "/hotels/:id"
end