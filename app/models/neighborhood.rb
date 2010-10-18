class Neighborhood < ActiveRecord::Base
  belongs_to :regional
  belongs_to :continent
  belongs_to :country
  belongs_to :subcountry
  belongs_to :city
end
