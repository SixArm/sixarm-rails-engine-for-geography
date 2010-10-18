namespace :db do
  namespace :seed do
    task :continents =>  %w(environment) do
      path=File.joindir(__FILE__,'..','..','db','seeds','continents.tdf')
      File.readrows(path).each{|row|
      
        ## Input
        iso,name_en=row
	name_en_searchable=name_en.downcase.gsub(/[^-\w\.\' ]/,'')

	## Insert
        Continent.seed(:iso,{:iso=>iso,:name_en=>name_en,:name_en_searchable=>name_en_searchable})

      }
    end
  end
end
