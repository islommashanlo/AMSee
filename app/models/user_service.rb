# == Schema Information
#
# Table name: user_services
#
#  id                   :integer          not null, primary key
#  user_id              :integer          not null
#  streaming_service_id :integer          not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
class UserService < ApplicationRecord
  belongs_to :user
  belongs_to :streaming_service
end
