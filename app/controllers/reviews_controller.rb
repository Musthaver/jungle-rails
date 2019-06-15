class ReviewsController < ApplicationController
    before_filter :deny_access, :unless => :current_user
    
    def create
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
        @review.user = current_user

        if @review.save
          redirect_to products_path, notice: 'Review created!'
        else
            redirect_to products_path
            puts @review.errors.full_messages
        end
    end

    private

    def review_params
      params.require(:review).permit(
        :rating,
        :description
      )
    end

end
