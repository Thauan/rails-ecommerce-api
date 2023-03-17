module Api
  module V1
    class BrandsController < BaseController
      def index
        @brands = Brand.all

        render json: { brands: @brands }, status: :ok
      end

      def create
        @brand = Brand.new(category_params)
        
        if @brand.save
          render json: { brand: @brand }, status: :ok
        else
          render json: { error: 'Unable to create product'}, status: 400
        end
      end

      def show
        @brand = Brand.find(params[:id])
        render json: { brand: @brand }, status: :ok
      end

      def delete
        @brand = Brand.find(params[:id])
        
        if @brand
          @brand.destroy
          render json: { message: 'Brand successfully deleted' }, status: :ok
        else
          render json: { error: 'Unable to delete brand'}, status: 400
        end
      end

      private

      def brand_params
        params.require(:brand).permit(:name, :brief, :slug, :web_address, :active)        
      end
    end
  end
end
  