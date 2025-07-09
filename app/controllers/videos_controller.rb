class VideosController < ApplicationController
    def index
        @videos = Video.all
    end
    
    def new
        @video = Video.new
    end

    def create
        video = Video.new(video_params)
        if video.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @video = Video.find(params[:id])
    end

    def edit
        @video = Video.find(params[:id])
    end

    def update
        video = Video.find(params[:id])
        if video.update(video_params)
            redirect_to :action => "show", :id => video.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        video = Video.find(params[:id])
        video.destroy
        redirect_to action: :index
    end

    private
    def video_params
        params.require(:video).permit(:video, :body)
    end
end
