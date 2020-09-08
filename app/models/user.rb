# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  password_digest :string
#  name            :string
#  location        :string
#  age             :integer
#  bio             :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    has_secure_password
    has_many :user_movies
    has_many :movies, through: :user_movies
    has_many :user_services
    has_many :streaming_services, through: :user_services
    has_many :user_view_parties
    has_many :view_parties, through: :user_view_parties

    #self referring table

    has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
    has_many :followeds, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    validates :username, uniqueness: true
end
