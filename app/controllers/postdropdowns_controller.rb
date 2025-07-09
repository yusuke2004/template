class PostdropdownsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :update, :destroy]

    def index
        if params[:dropdown_id].present?
            @postdropdowns = Postdropdown.where(dropdown_id: params[:dropdown_id])
        elsif params[:search].present?
            search = params[:search]
            @postdropdowns = Postdropdown.where("storename LIKE ? OR menu LIKE ? OR place LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
        else
            @postdropdowns = Postdropdown.all
        end
    end
    
    def new
        @postdropdown = Postdropdown.new
    end

    def create
        postdropdown = Postdropdown.new(postdropdown_params)
        if postdropdown.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @postdropdown = Postdropdown.find(params[:id])
    end

    def edit
        @postdropdown = Postdropdown.find(params[:id])
    end

    def update
        postdropdown = Postdropdown.find(params[:id])
        if postdropdown.update(postdropdown_params)
            redirect_to :action => "show", :id => postdropdown.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        postdropdown = Postdropdown.find(params[:id])
        postdropdown.destroy
        redirect_to action: :index
    end

    private
    def postdropdown_params
        params.require(:postdropdown).permit(:title, :body, :dropdown_id)
    end
end
