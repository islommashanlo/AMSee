class CreateUserViewParties < ActiveRecord::Migration[6.0]
  def change
    create_table :user_view_parties do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :view_party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
