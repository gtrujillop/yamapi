module Api
  module V1
    class MoviesController < ApplicationController
      def index
        @movies = Movie.all.includes(:seasons)
        render json: MovieBlueprint.render(@movies, render_opts), status: :ok
      end

      private

      def render_opts
        { 
          view: params[:commit]&.downcase&.to_sym 
        }
      end
      
      
    end
  end
end
