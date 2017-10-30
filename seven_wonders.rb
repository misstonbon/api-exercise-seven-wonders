require 'httparty'
require 'ap'

seven_wonders = ["Great Pyramind of Giza", "Hanging Gardens of Babylon", "Colossus of Rhodes", "Pharos of Alexandria", "Statue of Zeus at Olympia", "Temple of Artemis", "Mausoleum at Halicarnassus"]

BASE_URL = "https://maps.googleapis.com/maps/"
API_KEY = "AIzaSyCEwA3FVAbzCIKRXzDcs3I34U1GIXgyV2c"

def get_coordinates(place)
  url = BASE_URL + "api/geocode/json?&address=" + "#{place}"
  ap url
  response = HTTParty.get(url).parsed_response
  return response["results"].first["geometry"]["location"]
end

coordinates = {}
seven_wonders.each do |place|
  coordinates[place] = get_coordinates(place)
end

ap coordinates
