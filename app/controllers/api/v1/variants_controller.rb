module Api
  module V1
    class VariantsController < BaseController
      def index
        @variants = Variant.all

        render json: { variants: @variants }, status: :ok
      end

      def create
        @variant = Variant.new(variant_params)
        
        if @variant.save
          render json: { variant: @variant }, status: :ok
        else
          render json: { error: 'Unable to create variant'}, status: 400
        end
      end

      def show
        @variant = Variant.find(params[:id])
        render json: { variant: @variant }, status: :ok
      end

      def delete
        @variant = Variant.find(params[:id])
        
        if @variant
          @variant.destroy
          render json: { message: 'Variant successfully deleted' }, status: :ok
        else
          render json: { error: 'Unable to delete variant'}, status: 400
        end
      end

      private

      def variant_params
        params.require(:variant).permit(:value, :quantity, :meta_datas, :variant_type)        
      end
    end
  end
end