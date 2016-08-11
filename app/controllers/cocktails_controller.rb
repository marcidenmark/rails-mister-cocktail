
class CocktailsController < ApplicationController
  before_action :set_a_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def create
    @cocktail = Cocktail.new(cocktail)
    if @cocktail.save
      redirect_to cocktail(@cocktail)
    else
      @errors = @cocktail.errors.full_messages
      render :new
    end
  end


  def edit
  end

  def create
  end


  def update
    @cocktail.update(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      @errors = @cocktail.errors.full_messages
      ender :edit
    end
  end

  def destroy
  end

  private
  def set_a_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

end
