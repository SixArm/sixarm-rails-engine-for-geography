class Subcountry < ActiveRecord::Base
  belongs_to :regional
  belongs_to :continent
  belongs_to :country
  has_many :cities
  has_many :neighborhoods
end
