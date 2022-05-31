class Studio < ApplicationRecord
  validates_presence_of :name, :location

  has_many :movies
  has_many :actors, through: :movies
end
