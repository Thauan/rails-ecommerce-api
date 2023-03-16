module Api
  module V1
    class BrandsController < BaseController
      def index
        brands = Brand.all

        render json: { brands: brands }, status: :ok
      end

      def create; end

      def show; end

      def delete; end
    end
  end
end
  