# == Schema Information
#
# Table name: service_movies
#
#  id                   :integer          not null, primary key
#  streaming_service_id :integer          not null
#  movie_id             :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class ServiceMovie < ApplicationRecord
  belongs_to :streaming_service
  belongs_to :movie
end
