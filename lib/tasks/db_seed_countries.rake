namespace :db do
  namespace :seed do
    task :countries =>  %w(environment) do
      path=File.joindir(__FILE__,'..','..','db','seeds','countries.tdf')
      File.readrows(path).each{|row|

        ## Input
        continent_iso,iso,iso3,isonum,name_en=row
	name_en_searchable=name_en.downcase.gsub(/[^-\w\.\' ]/,'')

	## Lookup
	(continent=Continent.find_by_iso(continent_iso)) and continent_id=continent.id

	## Insert
        Country.seed([:continent_id,:iso],{:continent_id=>continent_id,:iso=>iso,:iso3=>iso3,:isonum=>isonum,:name_en=>name_en,:name_en_searchable=>name_en_searchable})

      }
    end
  end
end
