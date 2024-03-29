module Api
    module V1
        class ReviewsController <  ApplicationController
            protect_from_forgery with: :null_session

            def index
                reviews = Review.all
                render json: ReviewSerializer.new(reviews).serialized_json
            end

            def create
                review = Review.new(review_params)
                if review.save
                    render json: ReviewSerializer.new(review).serialized_json
                else
                    render json: { error: review.errors.messages }, status: 422
                end
            end

            def destroy
                review = Review.find_by(params[:id])

                if review.destroy
                    render head :no_content
                else
                    render json: { error: review.errors.messages }, status: 422
                end
            end

            private 

            def review_params 
                params.require(:review).permit(:title, :description, :score, :movie_id)
            end
        end
    end
end