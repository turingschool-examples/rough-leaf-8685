class Studio < ApplicationRecord
  has_many :movies

  def movie_titles
    movies.pluck(:title)
  end

end
