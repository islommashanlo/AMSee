# == Schema Information
#
# Table name: user_movies
#
#  id          :integer          not null, primary key
#  would_watch :boolean
#  seen_before :boolean
#  rating      :integer
#  review      :string
#  movie_id    :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class UserMovie < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  validates :rating,  numericality: {maximum: 10}


  def wacthed?

  end
  
end
