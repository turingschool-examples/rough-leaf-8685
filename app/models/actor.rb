class Actor < ApplicationRecord
  validates_presence_of :name, :age

  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.ordered_by_age
    order(:age)
  end

  def self.average_age
    average(:age)
  end
end
