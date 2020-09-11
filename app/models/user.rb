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
    has_many :user_movies, dependent: :destroy
    has_many :movies, through: :user_movies
    has_many :user_services, dependent: :destroy
    has_many :streaming_services, through: :user_services
    has_many :user_view_parties, dependent: :destroy
    has_many :view_parties, through: :user_view_parties
    has_one_attached :profile_pic

    #self referring table

    has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
    has_many :followeds, through: :active_relationships, source: :followed
    has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower
    validates :username, uniqueness: {case_sensititve: :false}
    validates :name, presence: true
    validates :age, numericality: {greater_than: 10}
    validates :bio, length: {minimum: 10}
    validates :location, length: {minimum: 3}

    def self.friends?(current_user, other_user)
        Relationship.find_by(follower_id: current_user.id, followed_id: other_user.id )
    end

    def streaming_services=(services)
        services.each do |service_id|
         if service_id.present?
            UserService.find_or_create_by(streaming_service_id: service_id, user_id: self.id)
         end
        end
        
    end

    def have_movie?(movie)
        UserMovie.find_by(user: self, movie: movie)
    end

    def want_to_see
        self.user_movies.select {|movie| movie.would_watch == true }
    end

    def have_seen
        self.user_movies.select {|movie| movie.seen_before == true}
    end

    def watch_again
        want_to_see & have_seen
    end

    def friends_party
        all_friends = self.followeds.select {|followed| followed.view_parties.present? }.map {|user| user.view_parties }
        all_friends.flatten.reject {|party| self.view_parties.include?(party)}
    end
  
end
