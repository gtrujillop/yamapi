module Api
  module V1
    class SeasonsController < ApplicationController
      def index
        @seasons = movie.seasons.includes(:episodes)
        render json: SeasonBlueprint.render(@seasons, view: :with_episodes)
      end

      private

      def movie
        @movie ||= Movie.find(params[:movie_id])
      end
    end
  end
end
