class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.oldest_to_youngest
    order(age: :desc)
  end

  def self.average_age
    average(:age)
  end
end
