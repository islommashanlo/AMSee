# == Schema Information
#
# Table name: streaming_services
#
#  id            :integer          not null, primary key
#  name          :string
#  streaming_url :string
#  cost          :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class StreamingService < ApplicationRecord
    has_many :user_services
    has_many :users, through: :user_services
    has_many :service_movies
    has_many :movies, through: :service_movies
end
