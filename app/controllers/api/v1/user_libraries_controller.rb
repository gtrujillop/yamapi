module Api
  module V1
    class UserLibrariesController < ApplicationController
      def show
        @user_library = UserLibrary.find(params[:id])
        render json: UserLibraryBlueprint.render(@user_library, view: :with_orders)
      end
    end
  end
end
