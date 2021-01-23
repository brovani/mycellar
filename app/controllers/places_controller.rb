class PlacesController < ApplicationController

  before_action :set_place, only: %i[show edit update destroy]
  before_action :place_params, only: %i[create update]
  
  require 'open-uri'
  require 'nokogiri'
  require 'mechanize'
  require 'csv'
  
  def index
    @places = Place.all
    places_overview
  end

  def show
    set_place
    place_overview(@place)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end

  def edit
    set_place
  end

  def update
    set_place
    if @place.update(place_params)
    flash.alert = 'Place updated successfully'
    redirect_to places_path
    else
    flash.alert = 'There was an error updating place'
    render :edit
    end
  end

  def destroy
    set_place
    if @place.destroy
    flash.notice = 'Place deleted successfully'
    redirect_to places_path
    else
    flash.notice = 'There was an error deleting this place'
    end
  end

  private

  def places_overview
    places_overview = []
    @places.each do |place|
      places_overview.push(place_overview(place))
    end
    @places_overview = places_overview
  end

  def place_overview(place)
    @place = place
    place_overview = []
    place_overview.push(@place)
    place_overview.push(price_paid(place))
    place_overview
  end
  
  def price_paid(place)
    @place = place
    price_paid = 0
    @place.units.each do |unit|
      price_paid += price_paid_unit(unit)
    end
    price_paid
  end

  def price_paid_unit(unit)
    @unit = unit
    price_paid_unit = 0
      @unit.bottles.each do |bottle|
      price_paid_unit += bottle.pre_tax_cost.to_f if bottle.tax_status = "IB"
      price_paid_unit += bottle.post_tax_cost.to_f if bottle.tax_status = "DP"
    end
    price_paid_unit
  end
  helper_method :price_paid_unit

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(
      :id,
      :user_id,
      :name,
      :account_number,
      :address)
  end

  # def login_to_website
  #   email = "bob@me.com"
  #   password = "secure_pass5!" 
  #   mechanize = Mechanize.new
  #   url = 'http://www.local-response.xyz/users/sign_in'
  #   login_page = mechanize.get url
  #   # Click the login link
  #   # login_page = mechanize.click(page.link_with(text: /Log In/))
  #   # submit the login form
  #   form = login_page.forms.first
  #   form.field_with(id: "email").value = email
  #   form.field_with(id: "password").value = password
  #   form.submit
  # end

  # def import_from_website
  #   # 1. Fetch the data stored in this place 
  #   url = "http://www.local-response.xyz/bookings"
  #   search_results = []
  #   html_doc = Nokogiri::HTML(open(url), nil, 'utf-8')
  #   html_doc.search('.bookings-index').first(5).each do |element|
  #   raise
  #     # element.text.strip
  #   # puts element.attribute('href').value
  #   end
  #   # 2. Store the search results
  # end

  # def download_csv
  #   url =  ""
  #   download = open(url)
  #   IO.copy_stream(download, 'test.csv')
  #   CSV.new(download).each do |l|
  #     puts l
  #   end
  # end

  # def load_csv
  #   CSV.foreach(@csv_file) do |row|
  #     @recipes << Recipe.new(row[0], row[1])
  #   end
  # end

  # def save_to_csv
  #   CSV.open(@csv_file, 'wb') do |csv|
  #     @recipes.each do |recipe|
  #       csv << [recipe.name, recipe.description]
  #     end
  #   end
  # end

  # this method will return true if there is at least one professional storage
  
end