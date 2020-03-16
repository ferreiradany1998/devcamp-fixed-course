class ApplicationController < ActionController::Base
  include DeviseWhitelist

  before_action :set_source

  #Set params q in the session with id source if it exists
  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
