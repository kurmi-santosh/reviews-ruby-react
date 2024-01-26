module Api
    module V1
        class MoviesController < ApplicationController
            protect_from_forgery with: :null_session
            def index
                movies = Movie.all
                render json: MovieSerializer.new(movies, options).serialized_json
            end

            def show
                movie = Movie.find_by(slug: params[:slug])
                render json: MovieSerializer.new(movie, options).serialized_json
            end

            def create
                movies = Movie.new(movie_params)
                if airline.save
                    render json: MovieSerializer.new(movies).serialized_json
                else
                    render json: { error: movie.errors.messages }, status: 422
                end  
            end

            def update
                movie = Movie.find_by(slug: params[:slug])
                if movie.update(movie_params)
                    render json: MovieSerializer.new(movie, options).serialized_json
                else
                    render json: { error: movie.errors.messages }, status: 422
                end  
            end

            def destroy
                movie = Movie.find_by(slug: params[:slug])
                if movie.destroy
                    render head :no_content
                else
                    render json: { error: movie.errors.messages }, status: 422
                end  
            end

            private

            def movie_params
                params.require(:movie).permit(:name, :image_url)
            end

            def options
                @options ||= { include: %i[reviews]}
            end
        end
    end
end