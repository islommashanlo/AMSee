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

    private
    
    def find_streaming_service
         @streaming_service = StreamingService.find(params[:id])
    end

end
