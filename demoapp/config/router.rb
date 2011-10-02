Merb.logger.info("Compiling routes...")
Merb::Router.prepare do

  # Requests for Antiques are handled by Merb
  match("/antiques").to(:controller => "antiques", :action => "index").name(:antiques)

  # Merb also handles its own home page, but because the Rails route
  # is a wildcard it requires _something_ to be present in the URI,
  # so this will never be triggered.
  # match('/').
  #     to(:controller => "home", :action => "index").
  #     name(:home)

end