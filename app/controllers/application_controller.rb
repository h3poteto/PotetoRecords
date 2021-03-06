class ApplicationController < ActionController::Base
  protect_from_forgery unless: proc { @basic_auth_token_request }
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << :name
    end
    def authenticate_with_basic
      return unless params['token'] and params['token'] == ENV["IPHONE_TOKEN"]

      request_http_basic_authentication unless authenticate_with_http_basic do |email, pass|
        begin
          if sign_in(User.authenticate(email, pass))
            logger.info "* Authenticated by basic auth: #{email}"
            @basic_auth_token_request = true
            return
          end

        rescue ActiveRecord::RecordNotFound => exception
          logger.info "[Authenticated by basic auth error] email: #{email} password: #{!!pass} (#{exception.class}: #{exception.message})"
          respond_to do |format|
            format.html { redirect_to root_path, notice: exception.message }
            format.json { render json: { errors: exception.message }.to_json, status: :unauthorized }
          end
        end
      end
    end
end
