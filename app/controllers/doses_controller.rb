class DosesController < ApplicationController
  before_action :find_cocktail, only: [ :new, :show, :create ]
  #before_action :find_ingredient, only: [ :new, :show, :create]

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all

  end

  def create
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    respond_to do |format|
      format.html { redirect_to cocktails, notice: 'Dose was successfully destroyed.' }
    end
  end

  private

def find_cocktail
  @cocktail = Cocktail.find(params[:cocktail_id])
end



  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end

end



