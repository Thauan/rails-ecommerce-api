class Api::V1::LoginController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_user
  
    skip_before_action :check_authentication

    def sign_in  
      result = AuthenticateUser.authenticate(user: user, password: sign_in_params[:password])

      if result
        render json: { payload: result }, status: :ok
      else
        render json: { errors: 'Unathorized' }, status: :unauthorized
      end
    end

    def refresh_token
      result = GenerateRefreshToken.generate(identifier: params[:refresh_token])

      if result
        render json: { payload: result }, status: :ok
      else
        render json: { errors: 'Invalid Token' }, status: :bad_request
      end
    end

    private

    def sign_in_params
      params.require(:user).permit(:email, :password)
    end

    def user
      @user ||= User.find_by!(email: sign_in_params[:email])
    end

    def invalid_user
      render json: { errors: 'Unathorized User' }, status: :unauthorized
    end
end
