class ProfilesController < ApplicationController
  def index
    @user = User.all
    @post = Post.all
  end

  def show
  end
end