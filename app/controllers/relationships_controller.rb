class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
  def show
    @user  = User.find(params[:id])
    if(params[:type]=="following")
      @title = "Following"
      @users = @user.following.paginate(page: params[:page])
    else if(params[:type]=="followers")
      @title = "Followers"
      @users = @user.followers.paginate(page: params[:page])
      end
    end
  end
  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end