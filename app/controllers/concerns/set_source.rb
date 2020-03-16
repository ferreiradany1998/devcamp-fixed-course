module SetSource
  extend ActiveSupport::Concern

included do
  before_action :set_source
end

  #Set params q in the session with id source if it exists
  def set_source
    session[:source] = params[:q] if params[:q]
  end
end