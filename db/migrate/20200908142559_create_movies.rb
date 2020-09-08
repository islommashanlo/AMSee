class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.datetime :release_date
      t.float :rating
      t.integer :tmdb_id
      t.string :img_url
      t.string :synopsis

      t.timestamps
    end
  end
end
