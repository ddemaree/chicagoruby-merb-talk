Demoapp::Application.routes.draw do

  # Request for Novelties are handled by Rails
  get "/novelties" => "novelties#index", :as => :novelties

  # Any requests not explicitly handled by a Rails route
  # above is handled by the Merb app
  match "*wildcard" => Merb::Rack::Application.new

  # The application home page is handled by Rails
  root :to => "home#index"

end
