class Continent < ActiveRecord::Base
  belongs_to :regional
  has_many :countries
  has_many :subcountries
  has_many :cities
  has_many :neighborhoods
end
