# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bruno = User.create!({email: 'bruno@me.com', password: 'secure_pass5!', password_confirmation: 'secure_pass5!'})

Place.create!({user_id: '1', name: 'LCB Vinotheque', account_number: 'JBROVA', address: 'Derby Road Burton-Upon-Trent Staffordshire DE14 1RY', longitude: '-1.635060', latitude: '52.813970', login: '', professional: true})
Place.create!({user_id: '1', name: 'Octavian', account_number: '99G', address: 'Corsham Cellars Eastlays Gastard Wiltshire Corsham SN13 9PP', longitude: '-2.164760', latitude: '51.407130', login: '', professional: true})
Place.create!({user_id: '1', name: 'Farr Customer Reserves', account_number: 'ROV001', address: 'Hangars 1-4 Lancaster Road Bowerhill Industrial Estate Melksham Wiltshire SN12 6SS', longitude: '-2.129850', latitude: '51.360170', login: '', professional: true}) 
Place.create!({user_id: '1', name: 'Arc Reserves', account_number: '1131', address: ' Locke-King Vaults, Weybridge', longitude: '', latitude: '', login: '', professional: true})
Place.create!({user_id: '1', name: 'BIWine Reserves', account_number: 'ROVA', address: '', longitude: '', latitude: '', login: '', professional: true})
Place.create!({user_id: '1', name: 'London Home', address: '2 Stanley road London SW19 8RL United Kingdom', longitude: '-0.199450', latitude: '51.419450', professional: false})
Place.create!({user_id: '1', name: 'Pyla Home',address: '133, boulevard de l’Atlantique 33115 Pyla sur mer, France', longitude: '-1.195640', latitude: '44.613310', professional: false})

Unit.create!({place_id: '1', bottles_inside: '3', pre_tax_cost: '180', capacity: '3', mixed: false, owc: false, oc: false, tax_status: 'IB'})
Unit.create!({place_id: '1', bottles_inside: '12', pre_tax_cost: '420', capacity: '12', mixed: false, owc: false, oc: false, tax_status: 'IB'})
Unit.create!({place_id: '1', bottles_inside: '12', pre_tax_cost:'459.75', capacity: '12', mixed: false, owc: false, oc: true, tax_status: 'IB'})
Unit.create!({place_id: '1', bottles_inside: '3', pre_tax_cost: '375', capacity: '3', mixed: false, owc: false, oc: false, tax_status: 'IB'})
Unit.create!({place_id: '1', bottles_inside: '6', pre_tax_cost: '440', capacity: '6', mixed: false, owc: false, oc: true, tax_status: 'IB'})
Unit.create!({place_id: '1', bottles_inside: '12', pre_tax_cost: '693.79', capacity: '12', mixed: false, owc: false, oc: true, tax_status: 'IB'})
Unit.create!({place_id: '1', bottles_inside: '3', pre_tax_cost: '630', capacity: '3', mixed: false, owc: false, oc: false, tax_status: 'IB'})
Unit.create!({place_id: '1', bottles_inside: '6', pre_tax_cost: '950', capacity: '6', mixed: false, owc: false, oc: true, tax_status: 'IB'})
Unit.create!({place_id: '1', bottles_inside: '6', pre_tax_cost: '790.14', capacity: '6', mixed: false, owc: false, oc: true, tax_status: 'IB'})

Unit.create!({place_id: '1', bottles_inside: '6', post_tax_cost: '1425', capacity: '12', mixed: false, owc: true, oc: false, tax_status: 'DP'})
Unit.create!({place_id: '1', bottles_inside: '3', post_tax_cost: '683.04', capacity: '6', mixed: false, owc: false, oc: true, tax_status: 'DP'})
Unit.create!({place_id: '1', bottles_inside: '1', post_tax_cost: '165.6', capacity: '3', mixed: false, owc: true, oc: false, tax_status: 'DP'})
Unit.create!({place_id: '1', bottles_inside: '9', post_tax_cost: '5011.61', capacity: '12', mixed: false, owc: true, oc: false, tax_status: 'DP'})

Unit.create!({place_id: '2', bottles_inside: '6', pre_tax_cost: '950', capacity: '6', mixed: false, owc: false, oc: true, tax_status: 'IB', rotation: '14/0020668'})
Unit.create!({place_id: '2', bottles_inside: '6', post_tax_cost: '1163.39', capacity: '6', mixed: false, owc: false, oc: false, tax_status: 'DP', rotation: '12/D006806'})
Unit.create!({place_id: '2', bottles_inside: '6', capacity: '6', mixed: 'yes', owc: false, oc: false, tax_status: 'DP', rotation: '20/D057759'})

Unit.create!({place_id: '6', name: 'Wine Fridge', bottles_inside: '7', capacity: '168', height_number: '14', width_number: '6', depth_number: '2', mixed: true, owc: false, oc: false, tax_status: 'DP', fridge: true})

Unit.create!({place_id: '7', name: 'Red Wine bottle Rack', bottles_inside: '2', bottles_size: '75 cl', capacity: '84', height_number: '14', width_number: '6', depth_number: '1', mixed: true, owc: false, oc: false, tax_status: 'DP', rack: true})
Unit.create!({place_id: '7', name: 'Red Wine magnum Rack', bottles_inside: '1', capacity: '84', bottles_size: '150 cl', height_number: '14', width_number: '6', depth_number: '1', mixed: true, owc: false, oc: false, tax_status: 'DP', rack: true})

Producer.create!({name: 'Château Montrose'})
Producer.create!({name: 'Château Rayas'})

Wine.create!({producer_id: '1', name: 'Château Montrose', country: 'France', region: 'Bordeaux'})
Wine.create!({producer_id: '1', name: 'Dame de Montrose', country: 'France', region: 'Bordeaux'})
Wine.create!({producer_id: '2', name: 'Château Rayas CDP rouge', country: 'France', region: 'Rhone'})
Wine.create!({producer_id: '2', name: 'Pignan', country: 'France', region: 'Rhone'})
Wine.create!({producer_id: '2', name: 'Château de Fonsalette rouge', country: 'France', region: 'Rhone'})
Wine.create!({producer_id: '2', name: 'Château de Fonsalette syrah', country: 'France', region: 'Rhone'})
Wine.create!({producer_id: '2', name: 'La Pialade', country: 'France', region: 'Rhone'})

Bottle.create!({unit_id: '1', wine_id: '5', vintage: '2009', bottle: true, date_in: '05/07/2017', number: '3'})
Bottle.create!({unit_id: '2', wine_id: '5', vintage: '2007', bottle: true, date_in: '31/07/2012', number: '12'})
Bottle.create!({unit_id: '3', wine_id: '5', vintage: '2005', bottle: true, date_in: '23/02/2011', number: '12'})
Bottle.create!({unit_id: '4', wine_id: '4', vintage: '2009', bottle: true, date_in: '05/07/2017', number: '3'})
Bottle.create!({unit_id: '5', wine_id: '4', vintage: '2007', bottle: true, date_in: '31/07/2012', number: '6'})
Bottle.create!({unit_id: '6', wine_id: '4', vintage: '2005', bottle: true, date_in: '30/11/2011', number: '12'})
Bottle.create!({unit_id: '7', wine_id: '3', vintage: '2009', bottle: true, date_in: '5/07/2017', number: '3'})
Bottle.create!({unit_id: '8', wine_id: '3', vintage: '2007', bottle: true, date_in: '31/07/2012', number: '6'})
Bottle.create!({unit_id: '9', wine_id: '3', vintage: '2006', bottle: true, date_in: '30/11/2011', number: '6'})

Bottle.create!({unit_id: '10', wine_id: '1', vintage: '1989', bottle: true, date_in: '16/11/2011', number: '6'})
Bottle.create!({unit_id: '11', wine_id: '1', vintage: '2009', bottle: true, date_in: '14/10/2014', number: '3'})
Bottle.create!({unit_id: '12', wine_id: '2', vintage: '2010', double_magnum: true, date_in: '8/03/2013', number: '1'})
Bottle.create!({unit_id: '13', wine_id: '1', vintage: '1990', bottle: true, date_in: '29/03/2017', number: '9'})

Bottle.create!({unit_id: '14', wine_id: '3', vintage: '2008', bottle: true, date_in: '25/02/2014', number: '6'})
Bottle.create!({unit_id: '15', wine_id: '3', vintage: '2005', bottle: true, date_in: '29/03/2017', number: '6'})

Bottle.create!({unit_id: '16', wine_id: '3', vintage: '2006', bottle: true, date_in: '22/06/2020', post_tax_cost: '314.68', number: '1'})
Bottle.create!({unit_id: '16', wine_id: '3', vintage: '2007', bottle: true, date_in: '22/06/2020', post_tax_cost: '701.35', number: '2'})
Bottle.create!({unit_id: '16', wine_id: '3', vintage: '2008', bottle: true, date_in: '25/11/2019', post_tax_cost: '300'})
Bottle.create!({unit_id: '16', wine_id: '3', vintage: '2006', bottle: true, date_in: '07/02/2011', post_tax_cost: '354.34', number: '2'})

Bottle.create!({unit_id: '17', wine_id: '6', bottle: true, vintage: '2007', date_in: '04/07/2012', post_tax_cost: '74', number: '1'})
Bottle.create!({unit_id: '17', wine_id: '3', bottle: true, vintage: '2006', date_in: '22/06/2020', post_tax_cost: '314.68', number: '1'})
Bottle.create!({unit_id: '17', wine_id: '4', bottle: true, vintage: '2007', date_in: '04/07/2012', post_tax_cost: '177.61', number: '1'})
Bottle.create!({unit_id: '17', wine_id: '5', bottle: true, vintage: '2006', date_in: '06/12/2011', post_tax_cost: '35.08', number: '1'})
Bottle.create!({unit_id: '17', wine_id: '5', bottle: true, vintage: '2007', date_in: '04/07/2012', post_tax_cost: '44.40', number: '1'})
Bottle.create!({unit_id: '17', wine_id: '5', bottle: true, vintage: '2008', date_in: '25/02/2014', post_tax_cost: '44.46', number: '1'})
Bottle.create!({unit_id: '17', wine_id: '7', bottle: true, vintage: '2014', date_in: '22/06/2020', post_tax_cost: '45.88', number: '1'})
Bottle.create!({unit_id: '18', wine_id: '1', vintage: '1989', bottle: true, date_in: '14/10/2014', post_tax_cost: '237.5', number: '1'})
Bottle.create!({unit_id: '18', wine_id: '1', vintage: '1990', bottle: true, date_in: '29/03/2017', post_tax_cost: '556.85', number: '1'})
Bottle.create!({unit_id: '19', wine_id: '1', vintage: '2000', magnum: true, date_in: '30/04/2003', post_tax_cost: '131.14', number: '1'})
