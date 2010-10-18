namespace :db do
  namespace :seed do
    task :neighborhoods => %w(db:seed:cities) do
      path=File.joindir(__FILE__,'..','..','db','seeds','neighborhoods.tdf')
      File.readrows(path).each{|row|

	## Input
        country_iso,subcountry_iso_suffix,city_name_en,name_en=row
	subcountry_iso="#{country_iso}-#{subcountry_iso_suffix}"
	name_en_searchable=name_en.downcase.gsub(/[^-\w\.\' ]/,'')

	## Lookup
	(country=Country.find_by_iso(country_iso)) and country_id=country.id
	(continent=(country ? country.continent : nil)) and continent_id=continent.id
	(subcountry=Subcountry.find_by_iso(subcountry_iso)) and subcountry_id=subcountry.id
	(city=City.find_by_country_id_and_subcountry_id_and_name_en(country_id,subcountry_id,city_name_en)) and city_id=city.id

	## Insert
        pp "continent_id:#{continent_id} country_iso:#{country_iso} country_id:#{country_id} subcountry_iso:#{subcountry_iso} subcountry_id:#{subcountry_id} city_name_en:#{city_name_en} city_id:#{city_id} name_en:#{name_en}"
	Neighborhood.seed([:continent_id,:country_id,:subcountry_id,:city_id],{:name_en=>name_en,:name_en_searchable=>name_en_searchable,:continent_id=>continent_id,:country_id=>country_id,:subcountry_id=>subcountry_id,:city_id=>city_id})

      }
    end
  end
end
