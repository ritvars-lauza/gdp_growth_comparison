=begin compare country gdp in a chosen year
=end
require 'httparty'

year = ARGV[0]

ARGV.clear

puts "Enter the first country for comparison:"
country_1 = gets.chomp

puts "Enter the second country for the comparison:"
country_2 = gets.chomp


HEADERS = {"X-Api-Key" => "T+qnKw9NM0hAsoV8KVyn7Q==Kv2PQFZ4rGEaHMEx"}
BASE_URL = 'https://api.api-ninjas.com/v1/gdp?'



def calculate_gdp_growth(year,country)
  year_param = "year=" + "#{year}"
  country_param = "&country="+"#{country}"
  full_url = BASE_URL + year_param + country_param
  gdp_growth = HTTParty.get(full_url, headers: HEADERS)[0]["gdp_growth"]
end


gdp_growth_country1  = calculate_gdp_growth(year,country_1)
gdp_growth_country2 = calculate_gdp_growth(year,country_2)

biggest_country =  country_1
if calculate_gdp_growth(year,country_1) < calculate_gdp_growth(year,country_2)
  biggest_country = country_2
end

puts "In the #{year} #{country_1.capitalize}'s GDP grew #{gdp_growth_country1}%, but #{country_2.capitalize}'s' GDP gew #{gdp_growth_country2}%.\n#{biggest_country.capitalize}'s' GDRP grew faster."



