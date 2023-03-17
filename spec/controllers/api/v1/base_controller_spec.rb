require 'rails_helper'

RSpec.describe Api::V1::BaseController do
  let(:parsed_body) { JSON.parse response.body }

  before do
    stub_const('ENV', 'DEVISE_JWT_SECRET_KEY' => 'long_encryption_string')
  end

  describe '#expired_token' do
    controller do
      def dummy_action
        render json: { payload: 'dummy_action' }
      end
    end

    let(:token) do
      payload = { exp: 5.minutes.until.to_i }

      JWT.encode(payload, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256')
    end

    context 'when token is expired' do
      before do
        request.headers['Authorization'] = token

        routes.draw { get '/api/v1/dummy_action' => 'api/v1/base#dummy_action' }
      end

      it 'has to return http status unauthorized' do
        get :dummy_action

        expect(response).to have_http_status(:unauthorized)
      end

      it 'has to return error message' do
        get :dummy_action

        expect(parsed_body).to eq({ 'errors' => 'Expired Token' })
      end
    end
  end

  describe '#invalid_token' do
    controller do
      def dummy_action
        render json: { payload: 'dummy_action' }
      end
    end

    context 'when token is invalid' do
      before do
        request.headers['Authorization'] = '12345'

        routes.draw { get '/api/v1/dummy_action' => 'api/v1/base#dummy_action' }
      end

      it 'has to return http status unauthorized' do
        get :dummy_action

        expect(response).to have_http_status(:unauthorized)
      end

      it 'has to return error message' do
        get :dummy_action

        expect(parsed_body).to eq({ 'errors' => 'Invalid Token' })
      end
    end
  end

  describe '#record_not_found' do
    context 'when a record is not found' do
      controller do
        skip_before_action :check_authentication

        def dummy_action
          User.find(-1)
        end
      end

      before do
        routes.draw { get '/api/v1/dummy_action' => 'api/v1/base#dummy_action' }
      end

      it 'has to returns http status not foud' do
        get :dummy_action

        expect(response).to have_http_status :not_found
      end

      it 'has to returns error message' do
        get :dummy_action

        expect(parsed_body).to eq({ 'errors' => 'Not Found' })
      end
    end
  end
end
