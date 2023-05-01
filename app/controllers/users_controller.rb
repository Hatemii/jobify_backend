class UsersController < ApplicationController

  def index
    users = User.all.order(id: :desc)
    render json: users
  end

  def show
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

  private

    def user_params
      params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
