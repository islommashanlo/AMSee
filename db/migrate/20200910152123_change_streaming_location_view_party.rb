class ChangeStreamingLocationViewParty < ActiveRecord::Migration[6.0]
  def change
    change_column :view_parties, :streaming_location, :belongs_to
  end
end
