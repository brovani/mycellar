module ApplicationHelper

  # This method returns true if there is at least one professional storage
  def any_professional_storage?
    count = 0
    Place.all.each { |place| count += 1 if place.professional? }
    true if count.positive?
  end

  # This method returns true if there is at least one non-professional storage
  def any_non_professional_storage?
    count = 0
    Place.all.each { |place| count += 1 if !place.professional? }
    true if count.positive?
  end
    
  def number_of_units(place)
    @place = place
    number_of_units = 0
    @place.units.each do |unit|
      number_of_units += 1
    end
    number_of_units
  end


  def place_bottles
    places_bottles = []
    @place = set_place
    @place.units.each do |unit|
      @unit = unit
      places_bottles.push(@unit)
      bottles_in_unit(unit)
      places_bottles.push(bottles_in_unit(unit))
    end
  end

  def bottles_in_unit(unit)
    @unit = unit
    bottles_in_unit = []
    h = 0
    b = 0
    m = 0
    dm = 0
    @unit.bottles.each do |bottle|
    h += 1 if bottle.half_bottle?
    b += 1 if bottle.bottle?
    m += 1 if bottle.magnum?
    dm += 1 if bottle.double_magnum?
    end
    bottles_in_unit.push(h)
    bottles_in_unit.push(b)
    bottles_in_unit.push(m)
    bottles_in_unit.push(dm)
    @bottles_in_unit = bottles_in_unit
  end
  
end
