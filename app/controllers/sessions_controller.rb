class SessionsController < ApplicationController
  def login
    user = User.find_by(email: login_params[:email])
    if user.try(:authenticate, login_params[:password])
      token = encode_token({user_id: user.id})

      render json: {
        user: user,
        token: token
      }
    else
      render json: {
        message: "Invalid email or password",
      }
    end
  end

  def login_params
    params.permit(:email, :password)
  end
end
