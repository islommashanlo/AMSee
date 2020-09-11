class RelationshipsController < ApplicationController
    def make_friend
        
        new_friend = Relationship.create(friend_params)
        if new_friend.valid?
            flash[:success] = "You are now friends"
            redirect_to user_path(params["friend"]["followed_id"])
        else
            flash[:errors]= new_friend.errors.full_messages
            redirect_to users_path
        end
    end

    def watch_list
        @user_movies = @current_user.followeds.map(&:want_to_see).flatten
    end

    def delete_friend
        friendship = Relationship.find_by(friend_params)
        friendship.destroy
        flash[:success] = "You have unfollowed"
        redirect_to users_path
    end

    def index
        @users = @current_user.followeds
    end

    private

    def friend_params
        params.require(:friend).permit(:follower_id, :followed_id)
    end
end
