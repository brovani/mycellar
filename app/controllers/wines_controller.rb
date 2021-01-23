class WinesController < ApplicationController
  before_action :set_wine, only: %i[show edit update destroy]
  before_action :wine_params, only: %i[create update]

  def index
    @wines = Wine.all
    wines_overview
    regions_overview
    subregions_overview
    all_vintages_in_cellar
  end

  def show
    set_wine
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
      if @wine.save
      flash.alert = 'Wine added'
      redirect_to wines_path
      else
      flash.alert = 'There was an error adding this wine'
      render :new
      end
  end

  def edit
    set_wine
  end

  def update
    set_wine
    if @wine.update(wine_params)
    flash.alert = 'Wine updated successfully'
    redirect_to wines_path
    else
    flash.alert = 'There was an error updating this wine'
    render :edit
    end
  end

  def destroy
    set_wine
    if @wine.destroy
    flash.notice = 'Wine deleted successfully'
    redirect_to wines_path
    else
    flash.notice = 'There was an error deleting this wine'
    end
  end

  private

  # Methods for wines

  # This method returns an array of arrays [wine, all vintages, all storages] for all wines
  def wines_overview
    wines_overview = []
    @wines.each do |wine|
      wines_overview.push(wine_overview(wine))
    end
    @wines_overview = wines_overview
  end

  # This method returns an array [wine, all vintages, all local storages, all remote strorages] of a given wine
  def wine_overview(wine)
    @wine_selection = wine
    wine_overview = []
    wine_overview.push(@wine_selection)
    wine_overview.push(all_vintages(wine))
    wine_overview.push(all_local_storages(wine))
    wine_overview.push(all_remote_storages(wine))
    wine_overview
  end

  # This method returns an array of all the vintages of a given wine
  def all_vintages(wine)
    @wine_selected = wine
    vintages = []
    all_vintages = []
    @wine_selected.bottles.each do |bottle|  
      vintages.push(bottle.vintage)
      end
    all_vintages = vintages.uniq.sort_by(&:downcase)
    all_vintages
  end

  # This method returns an array of all the storages of a given wine
  def all_storages(wine)
    @selected_wine = wine
    storages = []
    all_storages = []
    @selected_wine.units.each do |unit|  
      storages.push(unit.place.name)
      end
    all_storages = storages.uniq.sort_by(&:downcase)
    all_storages
  end
  
  # This method returns an array of all the local storages of a given wine
  def all_local_storages(wine)
    @selected_wine = wine
    local_storages = []
    all_local_storages = []
    @selected_wine.units.each do |unit|  
      local_storages.push(unit.place.name) if !unit.place.professional?
      end
    all_local_storages = local_storages.uniq.sort_by(&:downcase)
    all_local_storages
  end

  # This method returns an array of all the remote storages of a given wine
  def all_remote_storages(wine)
    @selected_wine = wine
    remote_storages = []
    all_remote_storages = []
    @selected_wine.units.each do |unit|  
      remote_storages.push(unit.place.name) if unit.place.professional?
      end
    all_remote_storages = remote_storages.uniq.sort_by(&:downcase)
    all_remote_storages
  end 

  # Methods for regions

  # This method returns an array with all the regions for all wines
  def all_regions
    @wines = Wine.all
    regions = []
    all_regions = []
    @wines.each do |wine|
      regions.push(wine.region)
      end
    all_regions = regions.uniq.sort_by(&:downcase)
    all_regions
  end

  # This method returns an array of arrays [region, all vintages, all local cellars, all remote cellars] for all regions
   def regions_overview
    @all_regions = all_regions
    regions_overview = []
    @all_regions.each do |region|
      regions_overview.push(region_overview(region))
    end
    @regions_overview = regions_overview
  end
  
  # This method returns an array [region, all vintages, all local cellars, all remote cellars] of a given region
  def region_overview(region)
    @region = region
    region_overview = []
    region_overview.push(@region)
    region_overview.push(all_vintages_region(region))
    region_overview.push(all_local_storages_region(region))
    region_overview.push(all_remote_storages_region(region))
    region_overview
  end
  
  # This method returns an array with all the wines for a given region
  def all_wines(region)
    @region = region
    wines_region = []
    all_wines_region = []
    @wines.each do |wine|  
      @wine = wine
      wines_region.push(@wine) if wine.region == region
      end
    all_wines_region = wines_region
    all_wines_region
  end

  # This method returns an array with all the vintages for a given region
  def all_vintages_region(region)
    @all_wines_region = all_wines(region)
    vintages_region = []
    all_vintages_region = []
    @all_wines_region.each do |wine|
      @wine = wine
        @wine.bottles.each do |bottle|
        vintages_region.push(bottle.vintage)
        end
      end
    all_vintages_region = vintages_region.uniq.sort_by(&:downcase)
    @all_vintages_region = all_vintages_region
  end

  # This method returns an array of all the local storages of a given region
  def all_local_storages_region(region)
    @selected_wines = all_wines(region)
    local_storages_region = []
    all_local_storages_region = []
    @selected_wines.each do |selected_wine|
      @selected_wine = selected_wine
      @selected_wine.units.each do |unit|
        local_storages_region.push(unit.place.name) if !unit.place.professional?
        end
      end
    all_local_storages_region = local_storages_region.uniq.sort_by(&:downcase)
    all_local_storages_region
  end

  # This method returns an array of all the remote storages of a given region
  def all_remote_storages_region(region)
    @selected_wines = all_wines(region)
    remote_storages_region = []
    all_remote_storages_region = []
    @selected_wines.each do |selected_wine|
      @selected_wine = selected_wine
      @selected_wine.units.each do |unit|
        remote_storages_region.push(unit.place.name) if unit.place.professional?
        end
      end
    all_remote_storages_region = remote_storages_region.uniq.sort_by(&:downcase)
    all_remote_storages_region
  end

# Methods for subregions

  # This method returns an array with all the subregions for all wines
  def all_subregions
    @wines = Wine.all
    subregions = []
    all_subregions = []
    @wines.each do |wine|
      subregions.push(wine.subregion)
      end
    all_subregions = subregions.uniq.sort_by(&:downcase)
    all_subregions
  end

  # This method returns an array of arrays [region, all vintages, all local cellars, all remote cellars] for all subregions
  def subregions_overview
    @all_subregions = all_subregions
    subregions_overview = []
    @all_subregions.each do |subregion|
      subregions_overview.push(subregion_overview(subregion))
    end
    @subregions_overview = subregions_overview
  end
  
  # This method returns an array [region, all vintages, all local cellars, all remote cellars] of a given subregion
  def subregion_overview(subregion)
    @subregion = subregion
    subregion_overview = []
    subregion_overview.push(@subregion)
    subregion_overview.push(all_vintages_subregion(subregion))
    subregion_overview.push(all_local_storages_subregion(subregion))
    subregion_overview.push(all_remote_storages_subregion(subregion))
    subregion_overview
  end
  
  # This method returns an array with all the wines for a given subregion
  def all_wines_subregion(subregion)
    @subregion = subregion
    wines_subregion = []
    all_wines_subregion = []
    @wines.each do |wine|  
      @wine = wine
      wines_subregion.push(@wine) if wine.subregion == subregion
      end
    all_wines_subregion = wines_subregion
    all_wines_subregion
  end

  # This method returns an array with all the vintages for a given subregion
  def all_vintages_subregion(subregion)
    @all_wines_subregion = all_wines_subregion(subregion)
    vintages_subregion = []
    all_vintages_subregion = []
    @all_wines_subregion.each do |wine|
      @wine = wine
        @wine.bottles.each do |bottle|
        vintages_subregion.push(bottle.vintage)
        end
      end
    all_vintages_subregion = vintages_subregion.uniq.sort_by(&:downcase)
    @all_vintages_subregion = all_vintages_subregion
  end

  # This method returns an array of all the local storages of a given subregion
  def all_local_storages_subregion(subregion)
    @selected_wines = all_wines_subregion(subregion)
    local_storages_subregion = []
    all_local_storages_subregion = []
    @selected_wines.each do |selected_wine|
      @selected_wine = selected_wine
      @selected_wine.units.each do |unit|
        local_storages_subregion.push(unit.place.name) if !unit.place.professional?
        end
      end
    all_local_storages_subregion = local_storages_subregion.uniq.sort_by(&:downcase)
    all_local_storages_subregion
  end

  # This method returns an array of all the remote storages of a given subregion
  def all_remote_storages_subregion(subregion)
    @selected_wines = all_wines_subregion(subregion)
    remote_storages_subregion = []
    all_remote_storages_subregion = []
    @selected_wines.each do |selected_wine|
      @selected_wine = selected_wine
      @selected_wine.units.each do |unit|
        remote_storages_subregion.push(unit.place.name) if unit.place.professional?
        end
      end
    all_remote_storages_subregion = remote_storages_subregion.uniq.sort_by(&:downcase)
    all_remote_storages_subregion
  end

  # Methods for Vintages

  # This method returns an array of all the vintages in the cellar
  def all_vintages_in_cellar
    @wines = Wine.all
    vintages = []
    all_vintages_in_cellar = []
    @wines.each do |wine|
      @wine = wine
        @wine.bottles.each do |bottle|  
        vintages.push(bottle.vintage)
        end
      end
    all_vintages_in_cellar = vintages.uniq.sort_by(&:downcase)
    @all_vintages_in_cellar = all_vintages_in_cellar
  end


  def set_wine
    @wine = Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(
      :id,
      :name,
      :color,
      :country,
      :region,
      :subregion,
      :nickname,
      :producer_id)
  end
 
end
