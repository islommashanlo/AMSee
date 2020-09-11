class ChangeColumnRatingUserMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :user_movies, :rating, :float
  end
end
