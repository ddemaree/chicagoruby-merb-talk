class ServerNameFix
  def initialize(app)
    @app = app
  end
  def call(env)
    # Fixes an issue where Passenger will send an underscore as the
    # server name, which confuses the Merb router
    env["SERVER_NAME"] = env["HTTP_HOST"] if env["SERVER_NAME"] == "_"

    # Merb uses the REQUEST_PATH to route requests; Rails does not
    env["REQUEST_PATH"] = env["PATH_INFO"]

    @app.call(env)
  end
end