# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    # @like = Like.new(user_id: current_user.id)
    # @like.save
    # @like_count = Like.where(user_id: current_user.id).count
    # byebug
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.like(current_user, params[:micropost_id])
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    # redirect_to root_path
  end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    @micropost.unlike(current_user, @micropost.id)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
    # redirect_to root_path
  end
end
