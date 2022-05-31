class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actors

  validates_presence_of :title, :creation_year, :genre
end
