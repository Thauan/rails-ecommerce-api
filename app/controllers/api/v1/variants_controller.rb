module Api
  module V1
    class VariantsController < BaseController
      def index
        variants = Variant.all

        render json: { variants: variants }, status: :ok
      end
      
      def create; end

      def show; end

      def delete; end
    end
  end
end