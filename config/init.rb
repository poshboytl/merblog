# Go to http://wiki.merbivore.com/pages/init-rb
 
require 'config/dependencies.rb'
 
use_orm :datamapper
use_test :rspec
use_template_engine :erb
 
Merb::Config.use do |c|
  c[:use_mutex] = false
  c[:session_store] = 'cookie'  # can also be 'memory', 'memcache', 'container', 'datamapper
  
  # cookie session store configuration
  c[:session_secret_key]  = '4a14ca3ab41894c23c8f55490e7ebb739a058456'  # required for cookie session store
  c[:session_id_key] = '_merblog_session_id' # cookie session id key, defaults to "_session_id"
end
 
Merb::BootLoader.before_app_loads do
  # This will get executed after dependencies have been loaded but before your app's classes have loaded.
  # dev_gems = Dir.glob("#{Merb.root}/gems/**/lib/*.rb")
  # # puts dev_gems
  # dev_gems.each { |dev_gem| require dev_gem }
end
 
Merb::BootLoader.after_app_loads do
  # This will get executed after your app's classes have been loaded.
end
