class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies
  has_many :studios, through: :movies

  validates_presence_of :name, :age

  def self.order_by_age
    order(age: :desc)
  end
  
  def self.average_age
    average(:age)
  end
end
