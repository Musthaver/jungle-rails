class ReviewsController < ApplicationController
    before_filter :deny_access, :unless => :current_user
    
    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
        @review.user = current_user

        if @review.save
          redirect_to @product, notice: 'Review created!'
        else
            redirect_to @product
            flash[:error] = 'An error occured!'
            puts @review.errors.full_messages
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        @product = Product.find(params[:product_id])
        redirect_to @product, notice: 'Review deleted!'
    end

    private

    def review_params
      params.require(:review).permit(
        :rating,
        :description
      )
    end

end
