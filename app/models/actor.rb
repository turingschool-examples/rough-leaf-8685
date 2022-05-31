class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def self.average_age 
    average(:age)
  end

  def self.sort_by_age
    order(:age)
  end
end
