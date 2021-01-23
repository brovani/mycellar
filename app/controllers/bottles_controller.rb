class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[show edit update destroy]
  before_action :bottle_params, only: %i[create update]

  def index
    @bottles = Bottle.all
  end

  def show
    @bottle = Bottle.find(params[:id])
  end

  def new
    @bottle = Bottle.new
  end

  def create
    @bottle = Bottle.new(bottle_params)
    @bottle.unit_id = bottle_params[:unit_id]
    @bottle.wine_id = bottle_params[:wine_id]
    if @bottle.save
      flash.alert = 'Bottle added'
      redirect_to bottles_path
      else
      flash.alert = 'There was an error adding this bottle'
      render :new
      end
  end

  def edit
    set_bottle
  end

  def update
    set_bottle
    if @bottle.update(bottle_params)
    flash.alert = 'Bottle updated successfully'
    redirect_to bottles_path
    else
    flash.alert = 'There was an error updating bottle'
    render :edit
    end
  end

  def destroy
    @bottle = Bottle.find(params[:id])
    if @bottle.destroy
    flash.notice = 'Bottle deleted successfully'
    redirect_to bottles_path
    else
    flash.notice = 'There was an error deleting this bottle'
    end
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end

  def bottle_params
    params.require(:bottle).permit(:id, :number, :vintage, :unit_id, :wine_id, :half_bottle, :bottle, :magnum, :double_magnum, :post_tax_cost, :tax_status)
  end
end
