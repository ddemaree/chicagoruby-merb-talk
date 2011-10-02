Demoapp::Application.routes.draw do

  # Request for Novelties are handled by Rails
  get "/novelties" => "novelties#index", :as => :novelties

  # Storing our Merb instance in a variable so the router won't
  # try to reinitialize it all the time
  @merb_application = Merb::Rack::Application.new

  # Any requests not explicitly handled by a Rails route
  # above is handled by the Merb app
  match "*wildcard" => @merb_application

  # The application home page is handled by Rails
  root :to => "home#index"

end
