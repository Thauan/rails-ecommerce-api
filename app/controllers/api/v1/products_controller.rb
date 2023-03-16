module Api
  module V1
    class ProductsController < BaseController
      def index
        products = Product.all

        render json: { products: products }, status: :ok
      end

      def create; end

      def show; end

      def delete; end
    end
  end
end