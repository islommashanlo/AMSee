class AddIconToStreamingServices < ActiveRecord::Migration[6.0]
  def change
    add_column :streaming_services, :icon, :string
  end
end
