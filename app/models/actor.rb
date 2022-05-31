class Actor < ApplicationRecord
  belongs_to :movies
  has_many :studios, through: :movies

  validates_presence_of :name, :age
end
