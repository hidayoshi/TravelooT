# frozen_string_literal: true

class UsersController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_admin!, only: [:index]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.all
  end

  def index
    @users = User.all.order('created_at DESC')
  end
end
