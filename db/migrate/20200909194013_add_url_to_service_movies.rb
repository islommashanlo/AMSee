class AddUrlToServiceMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :service_movies, :stream_location, :string
  end
end
