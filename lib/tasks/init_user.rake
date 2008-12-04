desc "initialize admin user"
task :inituser do

  Merb.start_environment(:testing => false, :adapter => 'runner', :environment => ENV['MERB_ENV'] || 'development')
  Dir["#{Merb.root}/app/models/*"].each { |m| require m }

  u = User.first(:login => 'admin')
  if u.nil? 
    u = User.new(:login => "admin")
  end
  u.password = u.password_confirmation = "pass"  
  u.save

end