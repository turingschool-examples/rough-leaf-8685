class CreateActorMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :actor_movies do |t|
      t.references :movies, foreign_key: true
      t.references :actors, foreign_key: true
    end
  end
end
