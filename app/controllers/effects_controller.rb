class EffectsController < ApplicationController

  before_action :set_effect, only: [:show, :edit, :update, :destroy]

  def index
    @effects = Effect.all
  end

  def show
  end

  def new
    @effect = Effect.new
  end

  def edit
  end

  def create
    @effect = Effect.new(effect_params)

    if @effect.save
      redirect_to @effect, notice: "Effect was successfully created."
    else
      render :new
    end
  end

  def update
    if @effect.update(effect_params)
      redirect_to @effect, notice: "Effect was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @effect.destroy
    redirect_to effects_url, notice: "Effect was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_effect
    @effect = Effect.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def effect_params
    params.require(:effect).permit(:name, :mood)
  end
end
