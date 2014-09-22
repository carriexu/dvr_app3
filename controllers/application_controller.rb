class ApplicationController < Sinatra::Base
########################
  # Configuration
  ########################
  # allow put/delete forms in browsers that don't support it.
  # we set this variable to the root of our project
  # whenever the application file (ie, controllers)
  # are not in the root of the project
  set :app_file, File.expand_path(File.dirname(__FILE__), "../")
  helpers ApplicationHelper

  enable :method_override
  # store data between HTTP requests in a cookie
  enable :sessions
  # session_secret will change with every start of the application
  # if we want to run shotgun, which creates new application instances
  # we must manually set session_secret
  set :session_secret, 'super secret'

  configure :test, :development do
    require 'sinatra/reloader'
    register Sinatra::Reloader
    # $redis = Redis.new
  end
  # configure :production do
  #   uri = URI.parse(ENV['REDISTOGO_URL'])
  #   $redis = Redis.new({:host => uri.host,
  #                       :port => uri.port,
  #                       :password => uri.password})
  # end
end
