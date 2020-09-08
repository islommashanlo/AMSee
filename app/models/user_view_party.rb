# == Schema Information
#
# Table name: user_view_parties
#
#  id            :integer          not null, primary key
#  user_id       :integer          not null
#  view_party_id :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class UserViewParty < ApplicationRecord
  belongs_to :user
  belongs_to :view_party
end
