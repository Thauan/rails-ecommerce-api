module Api
  module V1  
    class CategoriesController < ApplicationController
      def index
        @categories = Category.all

        render json: { categories: @categories }, status: :ok
      end

      def create
        @category = Category.new(category_params)
        
        if @category.save
          render json: { category: @category }, status: :ok
        else
          render json: { error: 'Unable to create product'}, status: 400
        end
      end

      def show
        @category = Category.find(params[:id])
        render json: { category: @category }, status: :ok
      end

      def delete
        @category = Category.find(params[:id])
        
        if @category
          @category.destroy
          render json: { message: 'Product successfully deleted' }, status: :ok
        else
          render json: { error: 'Unable to delete product'}, status: 400
        end
      end

      private

      def category_params
        params.require(:category).permit(:name, :description, :slug, :active)        
      end
    end
  end
end
