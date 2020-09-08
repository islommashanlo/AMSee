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
    has_many :friends, class_name:"Friend", source: :friend
    has_many :user_movies
    has_many :movies, through: :user_movies
    has_many :user_services
    has_many :streaming_services, through: :user_services
    has_many :user_view_parties
    has_many :view_parties, through: :user_view_parties
end
