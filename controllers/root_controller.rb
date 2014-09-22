class RootController < ApplicationController

  ########################
  # Routes
  ########################
  get('/') do
    render(:erb, :index)
  end
end
