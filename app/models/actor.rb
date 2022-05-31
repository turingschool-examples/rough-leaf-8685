class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.by_youngest
    order(:age)
  end

  def self.average_age
    average(:age)
  end

  def self.find_by_name(name)
    Actor.where(name: name).first
  end
end
