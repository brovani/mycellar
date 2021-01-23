class UnitsController < ApplicationController
  before_action :set_unit, only: %i[show edit update destroy]
  before_action :unit_params, only: %i[create update]

  def index
    @units = Unit.all
  end

  def show
    @unit = Unit.find(params[:id])
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new
    @unit.place_id = unit_params[:place_id]
    @unit.name = unit_params[:name]
    @unit.bottles_inside = unit_params[:bottles_inside]
      if @unit.save
      # flash.alert = 'Unit added'
      redirect_to units_path
      else
      # flash.alert = 'There was an error adding this unit'
      render :new
      end
  end

  def edit
    set_unit
  end

  def update
    set_unit
    if @unit.update(unit_params)
    flash.alert = 'Unit updated successfully'
    redirect_to units_path
    else
    flash.alert = 'There was an error updating unit'
    render :edit
    end
  end

  def destroy
    set_unit
    if @unit.destroy
    flash.notice = 'Unit deleted successfully'
    redirect_to units_path
    else
    flash.notice = 'There was an error deleting this unit'
    end
  end
  
  private
  
    def all_wines
    set_unit
    @all_wines_in_unit = @unit.wines.name.all 
    # @unit.bottles.each do |bottle|
    #   bottle.wine.name
    # end
  end
  helper_method :all_wines
  
  def set_unit
    @unit = Unit.find(params[:id])
  end

  def unit_params
    params.require(:unit).permit(
      :place_id,
      :name,
      :packaging,
      :fridge,
      :rack,
      :mixed,
      :owc,
      :oc,
      :mixed,
      :bottles_inside)
  end

end
