# == Schema Information
#
# Table name: movies
#
#  id           :integer          not null, primary key
#  title        :string
#  genre        :string
#  release_date :datetime
#  rating       :float
#  tmdb_id      :integer
#  img_url      :string
#  synopsis     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Movie < ApplicationRecord
    has_many :user_movies
    has_many :user, through: :user_movies
    has_many :service_movies
    has_many :streaming_services, through: :service_movies
    has_many :view_parties
end
