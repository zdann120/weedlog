class ReviewsController < ApplicationController
  def new
    @strain = Strain.find(params[:strain_id])
    @review = Review.new
    authorize @review
  end

  def create
    @strain = Strain.find(params[:strain_id])
    @review = Review.new(review_params)
    authorize @review
    @review.strain = @strain
    @review.user = current_user
    if @review.save
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
