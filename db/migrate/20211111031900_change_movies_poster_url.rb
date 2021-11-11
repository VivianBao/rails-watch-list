class ChangeMoviesPosterUrl < ActiveRecord::Migration[6.0]
  def change
    change_column :movies, :poster_url, :string
  end
end
