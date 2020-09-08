class RelationshipsController < ApplicationController
    def make_friend
        Relationship.create(user: @current_user.id, friend: friend_id )
    end
end
