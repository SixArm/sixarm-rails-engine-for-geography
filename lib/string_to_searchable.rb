class String
 def to_searchable
  self.downcase.gsub(/[^-\w\'\. ]/,'')
 end
end
