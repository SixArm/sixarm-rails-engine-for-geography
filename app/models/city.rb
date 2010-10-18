class City < ActiveRecord::Base
  belongs_to :regional
  belongs_to :continent
  belongs_to :country
  belongs_to :subcountry
  has_many :neighborhoods
end
