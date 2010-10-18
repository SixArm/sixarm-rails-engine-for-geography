class Country < ActiveRecord::Base
  belongs_to :regional
  belongs_to :continent
  has_many :subcountries
  has_many :cities
  has_many :neighborhoods
end
