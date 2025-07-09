class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_comment, only: [:edit, :update, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]

    def create
        post = Post.find(params[:post_id])
        comment = post.comments.build(comment_params) #buildを使い、contentとpost_idの二つを同時に代入
        comment.user_id = current_user.id
        if comment.save
            flash[:success] = "コメントしました"
        else
            flash[:success] = "コメントできませんでした"
        end
        redirect_back(fallback_location: root_path) #直前のページにリダイレクト
    end

    def edit
        @post = @comment.post
    end
    
    def update
        if @comment.update(comment_params)
            flash[:success] = "コメントを更新しました"
            redirect_to post_path(@comment.post)
        else
            flash[:error] = "更新に失敗しました"
            render :edit
        end
    end
    
    def destroy
        @comment.destroy
        flash[:success] = "コメントを削除しました"
        redirect_back(fallback_location: root_path)
    end

    private
    def set_comment
        @comment = Comment.find(params[:id])
    end
    
    def authorize_user!
        redirect_to root_path unless @comment.user == current_user
    end
    
    def comment_params
        params.require(:comment).permit(:content)
    end
end