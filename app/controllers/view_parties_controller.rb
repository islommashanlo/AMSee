class ViewPartiesController < ApplicationController
    before_action :new_party, only: [:new, :create]
    before_action :find_party, only: [:show, :update, :edit]
    def index
        if @current_user
            @view_parties = ViewParty.all.select{|e|e.users.include?(@current_user)}
        else
            @view_parties = ViewParty.all.sample(5)
        end
    end

    def update
        @view_party.update(party_params)
        if @view_party.valid?
            redirect_to view_party_path
        else
            flash[:errors] = @view_party.errors.full_messages
            redirect_to view_party_path
        end
    end

    def edit
        flash[:user_movie] = params[:id]
        byebug
    end

    def solo_party
        
        @view_party = ViewParty.new
        flash[:movie_id] = params[:movie][:movie_id]
        render :solo_party
    end
    def show
        flash[:view_party] = @view_party
    end

    def new
        
        @user_movie = UserMovie.find_by(user: @current_user, movie: Movie.find(flash[:movie_id]) )
        byebug
    end

    def create
        
        @view_party = ViewParty.new(party_params)
        if @view_party.save
            UserViewParty.find_or_create_by(user_id: @current_user.id, view_party_id: @view_party.id)
            redirect_to view_party_path(@view_party)
        else
          flash[:errors] = @view_party.errors
          redirect_to new_view_party_path
        end
    end
    

    private

    def party_params
        params.require(:view_party).permit(:name, :date, :streaming_location, :movie_id)
    end

    def new_party
        @view_party = ViewParty.new
    end

    def find_party
        @view_party = ViewParty.find(params[:id])
    end
    
end
