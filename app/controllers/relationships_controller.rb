class RelationshipsController < ApplicationController
    def make_friend
        byebug
        new_friend = Relationship.create(friend_params)
        if new_friend.valid?
            flash[:success] = "You are now friends"
            redirect_to user_path(params["followed_id"])
        else
            flash[:errors]= new_friend.errors.full_messages
            redirect_to users_path
        end
    end

    def delete_friend

    end

    private

    def friend_params
        params.require(:friend).permit(:follower_id, :followed_id)
    end
end
