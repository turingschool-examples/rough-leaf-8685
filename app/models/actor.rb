class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies
  has_many :studios, through: :movies

  validates_presence_of :name, :age

  def self.order_by_age
    order(:age)
  end

  def self.average_age
    average(:age).to_i
  end

  def co_actors
    require "pry"; binding.pry
    self.joins(:actor_movies) # <<< finish this <<<
  end

end
