class CreateStreamingServices < ActiveRecord::Migration[6.0]
  def change
    create_table :streaming_services do |t|
      t.string :name
      t.string :streaming_url
      t.float :cost

      t.timestamps
    end
  end
end
