class StreamingServicesController < ApplicationController
    before_action :find_streaming_service, only: [:show, :edit, :update]
    
    def new
        @streaming_service = StreamingService.new
    end
    def show
       
    end

    def index
        @streaming_services = StreamingService.all
    end

    def subscribe
        UserService.create(subs)
        redirect_to streaming_services_path
    end

    def unsubscribe
        unsubscribe = UserService.find_by(subs)
        unsubscribe.destroy
        redirect_to streaming_services_path
    end

    private
    
    def subs
        params.require(:sub).permit(:user_id, :streaming_service_id )
    end

    def find_streaming_service
         @streaming_service = StreamingService.find(params[:id])
    end

end
