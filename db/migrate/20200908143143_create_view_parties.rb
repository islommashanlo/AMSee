class CreateViewParties < ActiveRecord::Migration[6.0]
  def change
    create_table :view_parties do |t|
      t.string :name
      t.datetime :date
      t.belongs_to :movie, null: false, foreign_key: true
      t.string :streaming_location

      t.timestamps
    end
  end
end
