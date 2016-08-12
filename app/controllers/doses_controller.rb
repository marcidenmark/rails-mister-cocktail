class DosesController < ApplicationController

  before_action :set_a_dose, only: [:show, :edit, :update]

  def index
    @doses = Dose.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build
      @ingredients = Ingredient.all.map do |ingredient|
        [ingredient.name, ingredient.id]
    end
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = @cocktail.doses.build(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      @errors = @dose.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @dose.update(dose_params)
    if @dose.save
      redirect_to dose_path(@dose)
    else
      @errors = @dose.errors.full_messages
      render :edit
    end
  end

  def destroy
    Dose.find(params[:id]).destroy
    redirect_to cocktails_path
  end


  private
  def set_a_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end

