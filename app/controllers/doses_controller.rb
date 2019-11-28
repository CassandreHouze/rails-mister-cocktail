class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # @dose.cocktail_id = @cocktail.id
    @dose.save
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end

  def dose_params
    dose = params.require(:dose).permit(:description, :ingredient_id)
    cocktail_id = params.require(:cocktail_id)
    dose[:cocktail_id] = cocktail_id
    dose
  end
end
