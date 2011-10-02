# This file is used by Rack-based servers to start the application.
require ::File.expand_path('../config/environment',  __FILE__)

# Use the ServerNameFix middleware to fix certain Rack environment
# details that will confuse Merb
require ::File.expand_path('../app/middlewares/server_name_fix', __FILE__)
use ServerNameFix

# Run the Rails application
run Demoapp::Application
