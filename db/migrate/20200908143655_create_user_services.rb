class CreateUserServices < ActiveRecord::Migration[6.0]
  def change
    create_table :user_services do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :streaming_service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
