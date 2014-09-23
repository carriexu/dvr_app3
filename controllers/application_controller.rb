class ApplicationController < Sinatra::Base
########################
  # Configuration
  ########################
  # allow put/delete forms in browsers that don't support it.
  # we set this variable to the root of our project
  # whenever the application file (ie, controllers)
  # are not in the root of the project, OR they inherit
  # from a controller that is not in the root of the project
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

# add a flash hash to our website! https://github.com/treeder/rack-flash
  use Rack::Flash

end
