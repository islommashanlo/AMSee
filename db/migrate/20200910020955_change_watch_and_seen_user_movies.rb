class ChangeWatchAndSeenUserMovies < ActiveRecord::Migration[6.0]
  def change
    change_column :user_movies, :would_watch, :boolean, default: true
    change_column :user_movies, :seen_before, :boolean, default: false
  end
end
