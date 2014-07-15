# coding: utf-8
class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, only: [:create], if: Proc.new{|app|
    request.format == :json
  }
  respond_to :json


  def create
    if params[:token] != ENV["IPHONE_TOKEN"]
      render json: { errors: ActiveRecord::RecordNotSaved }.to_json, status: :unauthorized and return
    else
      user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password])
      if user.save
        sign_in user
        render status: 200, json: { success: true, info: "Registered", data: { user: user } }
      else
        render status: :unprocessable_entity, json: { success: false, info: user.errors, data: {} }
      end
    end
  end
end
