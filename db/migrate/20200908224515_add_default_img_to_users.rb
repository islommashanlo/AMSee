class AddDefaultImgToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :img, :string, default: 'amsee.png'
  end
end
