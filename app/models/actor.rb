class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def unique_coworkers
    # binding.pry
    unique_coworker_names = []
    movies.each do |movie|
      movie.actors.each do |actor|
        unique_coworker_names << actor.name
      end
    end
    unique_coworker_names.delete(self.name)
    return unique_coworker_names.uniq.join(", ")
    # binding.pry
    # ApplicationPet.where(application_form_id: application_form.id, pet_id: self.id).first
    # contestants.select(:hometown).distinct.pluck(:hometown).join ', '
    # movies
  end
end
