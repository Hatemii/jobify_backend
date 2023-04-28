class UsersController < ApplicationController

  def index
    users = User.all.order(id: :desc)
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.create!(user_params)
    
    if user.valid?
      token = encode_token({user_id: user.id})
      render json: { 
        user: user, 
        token: token 
      }
    else
      render json: { message: "something went wrong" }
    end

    rescue ActiveRecord::RecordInvalid => e
      render json: {message: e.message }
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

  private

    def user_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
