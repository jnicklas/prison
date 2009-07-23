class Prison::SessionController < ApplicationController
  unloadable

  def new
    render "session/new"
  end
end
