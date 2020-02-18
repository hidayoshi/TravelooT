# frozen_string_literal: true

class LikesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def create
    @micropost = Micropost.find(params[:micropost_id])
    @micropost.like(current_user, params[:micropost_id])
    @micropost.reload

    # respond_to do |format|
    #   format.html { redirect_to root_path }
    #   format.js
    # end
    redirect_to root_path
  end

  def destroy
    @micropost = Like.find(params[:id]).micropost
    @micropost.unlike(current_user, @micropost.id)
    @micropost.reload

    # respond_to do |format|
    #   format.html { redirect_to root_path }
    #   format.js
    # end
    redirect_to root_path
  end
end
