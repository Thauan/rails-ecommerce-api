module Api
    module V1
      class AuthenticateUser
        include TokenGenerator
  
        attr_accessor :user, :password, :expiration_time
  
        def self.authenticate(**nargs)
          new(**nargs).authenticate
        end
  
        def initialize(user:, password:, expiration_time: 15.minutes.from_now.to_i)
          @user = user
          @password = password
          @expiration_time = expiration_time
        end
  
        def authenticate
          return unless user.valid_password? password
  
          { token: token, refresh_token: refresh_token }
        end
  
        def token
          @token ||= generate_token(user, expiration_time)
        end
  
        def refresh_token
          @refresh_token ||= generate_refresh_token(user)
        end
      end
    end
end
  