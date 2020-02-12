# frozen_string_literal: true

class MicropostsController < ApplicationController
  #   before_action :authenticate_user
  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)
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
