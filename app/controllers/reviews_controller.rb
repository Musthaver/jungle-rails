class ReviewsController < ApplicationController

    def create
        @review = Review.where("product_id = ?", params[:product_id]).new #find(params[:product_id])
        puts params
    end

end
