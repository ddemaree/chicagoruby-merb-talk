# Go to http://wiki.merbivore.com/pages/init-rb

Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper

  # cookie session store configuration
  c[:session_secret_key] = "sekrit token"  # required for cookie session store
  c[:session_cookie_name] = "demo app" # cookie session name
  c[:session_id_key] = '_._session_id' # cookie session id key, defaults to "_session_id"

  # asset bundling settings
  c[:bundle_assets] = ENV['BUNDLEASSETS'] || !(Merb.env =~ /(development|test|cucumber)/)
  c[:decache_bundled_assets] = ENV['DECACHEBUNDLES'] || !%w(development test).include?(Merb.env)
end

# This used to be in environments/* but because we start the Merb app after those
# load, we lost the environment specific values.
case Rails.env
when /production/
  Merb::Config.use { |c|
    c[:exception_details] = false
    c[:default_cookie_domain] = "typekit.com"
    # This is the preferred cookie name, but we screwed it
    # up in the initial migration to rails. So, for now we
    # should use the longer cookie name.
    #c[:session_cookie_name] = "tks"
    c[:session_cookie_name] = "tk_session_production"
  }
when /staging/
  Merb::Config.use { |c|
    c[:log_auto_flush ] = true
    c[:log_level] = :debug
    c[:default_cookie_domain] = "typekit.com"
    c[:session_cookie_name] = "tk_session_staging"
  }
when /development/
  Merb::Config.use { |c|
    c[:exception_details] = true
    c[:reload_templates] = true
    c[:ignore_tampered_cookies] = true
  }
when /test|cucumber/
  Merb::Config.use { |c|
    c[:testing] = true
    c[:exception_details] = true
  }
end

Merb::BootLoader.before_app_loads do
  Merb.add_mime_type :otf, :to_otf, %w[font/otf]
  Merb.add_mime_type :eot, :to_eot, %w[font/eot]
  Merb.add_mime_type :svg, :to_svg, %w[image/svg+xml]
  Merb.add_mime_type :js,  :to_js,  %w[application/x-javascript]
  Merb.add_mime_type :css, :to_css, %w[text/css]
  Merb.add_mime_type :csv, :to_csv, %w[text/csv]
  Merb.add_mime_type :txt, :to_txt, %w[text/plain]
  Merb.add_mime_type :png, :to_png, %w[image/png]
end

