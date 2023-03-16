class Api::V1::BaseController < ApplicationController
  before_action :check_authentication
  skip_before_action :verify_authenticity_token, :authenticate_user!

  rescue_from JWT::VerificationError, JWT::DecodeError, with: :invalid_token
  rescue_from JWT::ExpiredSignature, with: :expired_token
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def authenticated?
    token.present? && current_user.present?
  end

  def check_authentication
    head :unauthorized unless authenticated?
  end

  def current_user
    @current_user ||= User.find(resource_id)
  end

  def token
    request.headers['Authorization']
  end

  def decode_token
    JWT.decode(token, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256')
  end

  def resource_id
    decode_token.dig(0, 'data', 'id')
  end

  def expired_token
    render json: { errors: 'Expired Token' }, status: :unauthorized
  end

  def invalid_token
    render json: { errors: 'Invalid Token' }, status: :unauthorized
  end

  def record_not_found
    render json: { errors: 'Not Found' }, status: :not_found
  end

  def unauthorized_user
    render json: { errors: 'Unathorized' }, status: :unauthorized
  end

  def page
    @page ||= params.fetch(:page, 1).to_i
  end
  helper_method :page

  def per_page
    @per_page ||= params.fetch(:per_page, 20).to_i
  end
  helper_method :per_page
end
