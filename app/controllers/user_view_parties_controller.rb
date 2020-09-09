class UserViewPartiesController < ApplicationController
    before_action :new_user_view_party, only: [:new, :create, :join_party]
    before_action :find_user_view_party, only: [:show, :update, :edit]

    def index
        @user_view_parties = UserViewParty.where(user_id: @current_user.id)
    end
    

    def create
        @user_view_party = UserViewParty.new(user_view_party_params)
        if @user_view_party.save
          redirect_to view_party_path(@user_view_party.view_party)
        else
          flash[:errors] = @user_view_party.errors
          redirect_to new_user_view_party_path
        end
    end
    
    def new

    end



    private
    

    def user_view_party_params
        params.require(:user_view_party).permit(:view_party_id, :user_id)
    end

    def new_user_view_party
        @user_view_party = UserViewParty.new
    end

    def find_user_view_party
        @user_view_party = UserViewParty.find(params[:id])
    end

end