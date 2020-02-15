# frozen_string_literal: true

class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
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

  private

  def micropost_params
    params.require(:micropost).permit(:description, :image)
  end
end
