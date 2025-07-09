class PostagsController < ApplicationController
        before_action :authenticate_user!, only: [:new, :update, :destroy]
    def index
        @postags = Postag.all
        if params[:tag_ids]
            @postags = []
            params[:tag_ids].each do |key, value|
                if value == "1"
                    tag_postags = Tag.find_by(name: key).postags
                    @postags = @postags.empty? ? tag_postags : @postags & tag_postags
                end
            end
        end

        if params[:tag]
            Tag.create(name: params[:tag])
        end
    end
    
    def new
        @postag = Postag.new
    end

    def create
        postag = Postag.new(postag_params)
        if postag.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @postag = Postag.find(params[:id])
    end

    def edit
        @postag = Postag.find(params[:id])
    end

    def update
        postag = Postag.find(params[:id])
        if postag.update(postag_params)
            redirect_to :action => "show", :id => postag.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        postag = Postag.find(params[:id])
        postag.destroy
        redirect_to action: :index
    end

    private
    def postag_params
        params.require(:postag).permit(:title, :body, tag_ids: [])
    end
end
