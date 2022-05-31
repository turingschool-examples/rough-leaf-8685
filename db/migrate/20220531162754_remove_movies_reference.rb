class RemoveMoviesReference < ActiveRecord::Migration[5.2]
  def change
    remove_column :actors, :movies_id
  end
end
