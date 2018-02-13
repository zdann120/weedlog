class ReviewsController < ApplicationController
  before_action :authenticate_user!
  def new
    @strain = Strain.find(params[:strain_id])
    @review = Review.new
  end

  def create
    @strain = Strain.find(params[:strain_id])
    @review = Review.new(review_params)
    @review.strain = @strain
    @review.user = current_user
    if @review.save!
      redirect_to @strain, notice: "Your review has been posted!"
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :retailer, :product_type, :retailer_id, effect_ids: [])
  end
end
