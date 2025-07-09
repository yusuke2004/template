class UsersController < ApplicationController
    def show
        @user = User.find(params[:id]) 
        @post_count = @user.posts.count # ページ数カウント機能
    end
end
