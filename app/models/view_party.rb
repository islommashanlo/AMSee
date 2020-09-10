# == Schema Information
#
# Table name: view_parties
#
#  id                 :integer          not null, primary key
#  name               :string
#  date               :datetime
#  movie_id           :integer          not null
#  streaming_location :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class ViewParty < ApplicationRecord
  belongs_to :movie
  has_many :user_view_parties
  has_many :users, through: :user_view_parties, dependent: :destroy



  def proper_date
    self.date.strftime('%A %B %d, %Y at %H:%M')
  end
end
