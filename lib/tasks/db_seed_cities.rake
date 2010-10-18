namespace :db do
  namespace :seed do
    task :cities =>  %w(db:seed:subcountries) do
      path=File.joindir(__FILE__,'..','..','db','seeds','cities.tdf')
      File.readrows(path).each{|row|

	## Input
        country_iso,subcountry_iso_suffix,name_en=row
	subcountry_iso="#{country_iso}-#{subcountry_iso_suffix}"
	name_en_searchable=name_en.downcase.gsub(/[^-\w\.\' ]/,'')

	## Lookup
	(country=Country.find_by_iso(country_iso)) and country_id=country.id
	(subcountry=Subcountry.find_by_iso(subcountry_iso)) and subcountry_id=subcountry.id

	## Insert
	pp "db:seed:cities country_iso:#{country_iso} subcountry_iso:#{subcountry_iso} name_en:#{name_en}"
	City.seed([:name_en,:country_id,:subcountry_id],{:name_en=>name_en,:name_en_searchable=>name_en_searchable,:country_id=>country_id,:subcountry_id=>subcountry_id})

      }
    end
  end
end
