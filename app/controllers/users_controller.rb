class UsersController < ApplicationController

  before_action :authorized, only: [:auto_login]

  def index
    users = User.all.order("id DESC")
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def new
    user = User.new
    render json: users
  end

  def edit
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    render json: user if user.update(user_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy

    render json: "successfully deleted"
  end
  
###############################################

# REGISTER
  def create
    @user = User.create!(user_params)
    if @user.valid?
      token = encode_token({user_id: @user.id})
      render json: {
        message:"user registered successfully",
        token: token,
        user: @user,
        admin: @user.admin
      }
    else
      render json: {error: "Invalid username or password"}
    end
  end

  # LOGGING IN
  def login
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      token = encode_token({user_id: @user.id})
      render json: { 
        message:"successfully logged in",
        token: token, 
        user: @user,
        admin: @user.admin,
        loggedIn: true
      }
    else
      render json: {
        error: "Invalid username or password",
        loggedIn: false
      }
    end
  end

  def auto_login
    render json: @user
  end

  private

    def user_params
      params.permit(:name,:surname,:email, :password, :password_confirmation)
    end
end
