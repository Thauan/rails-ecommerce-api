module Api
    module V1
      class GenerateRefreshToken
        include TokenGenerator
  
        attr_accessor :identifier
  
        def self.generate(**nargs)
          new(**nargs).generate
        end
  
        def initialize(identifier:)
          @identifier = identifier
        end
  
        def generate
          return if refresh_token.expired?
  
          { token: generate_token(user) }
        end
  
        private
  
        def user
          @user ||= refresh_token.user
        end
  
        def refresh_token
          @refresh_token ||= RefreshToken.find_by!(identifier: identifier)
        end
      end
    end
end
  