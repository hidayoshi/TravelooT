# frozen_string_literal: true

class MicropostsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!, only: %i[new create destroy]

  def index
    @microposts = Micropost.all
    @all_ranks = Micropost.find(Like.group(:micropost_id).order('count(micropost_id) desc').limit(4).pluck(:micropost_id)).reverse
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'Micropost successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      render 'microposts/new'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    flash[:success] = 'Micropost deleted'
    redirect_to request.referer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:description, :image)
  end
end
