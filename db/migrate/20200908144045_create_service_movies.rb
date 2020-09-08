class CreateServiceMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :service_movies do |t|
      t.belongs_to :streaming_service, null: false, foreign_key: true
      t.belongs_to :movie, null: false, foreign_key: true

      t.timestamps
    end
  end
end
