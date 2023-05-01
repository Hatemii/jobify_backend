class SessionsController < ApplicationController
  
  before_action :authorized, except: %i[signup]

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

  def signup
    user = User.create!(signup_params)
    
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
      render json: { message: e.message }
  end
  
  def login_params
    params.permit(:email, :password)
  end

  def signup_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
