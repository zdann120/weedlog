class RetailersController < ApplicationController

  before_action :set_retailer, only: [:show, :edit, :update, :destroy]

  def index
    @retailers = Retailer.all
    authorize @retailers
  end

  def show
  end

  def new
    @retailer = Retailer.new
    authorize @retailer
  end

  def edit
  end

  def create
    @retailer = Retailer.new(retailer_params)
    authorize @retailer

    if @retailer.save
      redirect_to @retailer, notice: "Retailer was successfully created."
    else
      render :new
    end
  end

  def update
    if @retailer.update(retailer_params)
      redirect_to @retailer, notice: "Retailer was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @retailer.destroy
    redirect_to retailers_url, notice: "Retailer was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_retailer
    @retailer = Retailer.find(params[:id])
    authorize @retailer
  end

  # Only allow a trusted parameter "white list" through.
  def retailer_params
    params.require(:retailer).permit(:name, :street_address, :city, :state, :zip)
  end
end
