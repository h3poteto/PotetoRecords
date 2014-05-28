class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery unless: proc { @basic_auth_token_request }
  before_action :authenticate_user!
end
