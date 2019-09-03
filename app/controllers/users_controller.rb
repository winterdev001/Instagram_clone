class UsersController < ApplicationController
  before_action :set_post, only: [:edit, :show, :update, :profile]

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @post = Post.all
    @user = User.all      
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Switch to the list screen and display a message saying "You have created new blog!"
      redirect_to  new_session_path ,notice: "You have signed up successfully, then Login now to continue!"
    else
      # Redraw the input form.
      render :new
    end
  end    

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(), notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def profile
    @user = User.all
  end

  private
  def set_post
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:fullname,:username, :email, :password, :password_confirmation, :image)
  end
end
