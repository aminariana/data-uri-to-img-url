class ApplicationController < ActionController::Base
  before_action :set_response_headers

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def set_response_headers
    headers['Access-Control-Allow-Origin'] = '*'
  end
end
