module Api
  module V1
    class ProductsController < BaseController
      def index
        @products = Product.all

        render json: { products: @products }, status: :ok
      end

      def create
        @product = Product.new(product_params)
        
        if @product.save
          render json: { products: @product }, status: :ok
        else
          render json: { error: 'Unable to create product'}, status: 400
        end
      end

      def show
        @product = Product.find(params[:id])
        render json: { product: @product }, status: :ok
      end

      def delete
        @product = Product.find(params[:id])
        
        if @product
          @product.destroy
          render json: { message: 'Product successfully deleted' }, status: :ok
        else
          render json: { error: 'Unable to delete product'}, status: 400
        end
      end

      private

      def product_params
        params.require(:product).permit(:name, :price, :slug, :description, :brief)        
      end
    end
  end
end