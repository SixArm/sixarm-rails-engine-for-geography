namespace :db do
  namespace :seed do
    task :subcountries =>  %w(db:seed:countries) do
      path=File.joindir(__FILE__,'..','..','db','seeds','subcountries.tdf')
      File.readrows(path).each{|row|

	## Input
        country_iso,subcountry_iso_suffix,name_en=row
	subcountry_iso="#{country_iso}-#{subcountry_iso_suffix}"
	name_en_searchable=name_en.downcase.gsub(/[^-\w\.\' ]/,'')

	## Lookup
	(country=Country.find_by_iso(country_iso)) and country_id=country.id
	(continent=(country ? country.continent : nil)) and continent_id=continent.id

	## Insert
	Subcountry.seed(:iso,{:iso=>subcountry_iso,:continent_id=>continent_id,:country_id=>country_id,:name_en=>name_en,:name_en_searchable=>name_en_searchable})

      }
    end
  end
end
