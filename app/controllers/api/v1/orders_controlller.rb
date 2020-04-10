module Api
  module V1
    class OrdersController < ApplicationController
      def create
        @order = Order.new(order_params)
        if @order.save
          render json: OrderBlueprint.render(@order)
        else
          render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def order_params
        params.require(:order).permit(
          :purchaseable_id, 
          :purchaseabe_type, 
          :video_quality, 
          :total_price, 
          :user_library_id
        )
      end
    end
  end
end
