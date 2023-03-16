require 'rails_helper'

RSpec.describe Api::V1::LoginController, type: :request do
  let(:parsed_body) { JSON.parse body }

  before do
    stub_const('ENV', 'DEVISE_JWT_SECRET_KEY' => '87654321')
  end

  describe '#sign_in' do
    let!(:user) do
      create :user, email: email
    end

    let(:params) do
      {
        user: {
          email: email,
          password: password
        }
      }
    end
  end
end