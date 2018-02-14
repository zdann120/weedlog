class StrainsController < ApplicationController
  before_action :set_strain, only: [:show, :edit, :update, :destroy]

  def index
    @strains = Strain.all
    authorize @strains
  end

  def show
  end

  def new
    @strain = Strain.new
  end

  def edit
  end

  def create
    @strain = Strain.new(strain_params)

    if @strain.save
      redirect_to @strain, notice: "Strain was successfully created."
    else
      render :new
    end
  end

  def update
    if @strain.update(strain_params)
      redirect_to @strain, notice: "Strain was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @strain.destroy
    redirect_to strains_url, notice: "Strain was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_strain
    @strain = Strain.find(params[:id])
    authorize @strain
  end

  # Only allow a trusted parameter "white list" through.
  def strain_params
    params.require(:strain).permit(:token, :name, :lineage, :description,
                                  effect_ids: [])
  end
end
