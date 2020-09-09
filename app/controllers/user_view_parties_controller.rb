class UserViewPartiesController < ApplicationController
    before_action :new_user_view_party, only: [:new, :create]
    before_action :find_user_view_party, only: [:show, :update, :edit]

    def create
        @user_view_party = UserViewParty.new(user_view_party_params)
        if @user_view_party.save
          redirect_to user_view_party_path(@user_view_party)
        else
          flash[:errors] = @user_view_party.errors
          redirect_to new_user_view_party_path
        end
    end
    
    def new

    end

   def join_party
        UserViewParty.create(user_id: @current_user.id, view_party_id: )
   end



    private

    def user_view_party_params
        params.require(:user_view_party).permit(:user_id, :view_party_id)
    end

    def new_user_view_party
        @user_view_party = UserViewParty.new
    end

    def find_user_view_party
        @user_view_party = UserViewParty.find(params[:id])
    end

end
