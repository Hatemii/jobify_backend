class SessionsController < ApplicationController
  
  before_action :authorized, except: %i[signup login logout]

  def login
    user = User.find_by(email: login_params[:email])
    return render json: { message: "Email doesn't exist" } unless user
    
    if user.try(:authenticate, login_params[:password])
      token = encode_token({user_id: user.id})

      # confirmation token / set expire
      confirmation_token_handle(user, token)

      render json: user
    else
      render json: { message: "Invalid email or password" }
    end
  end

  def signup
    user = User.create!(signup_params)
    
    if user.valid?
      token = encode_token({user_id: user.id})

      # confirmation token / set expire
      confirmation_token_handle(user, token)

      render json: user
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


  def logout
    if current_user
      current_user.update! confirmation_token: nil, expire_token_at: nil 
    end

    render json: "Successfully logged out"
  end
    
  private

    def confirmation_token_handle(user, token)
      # expire after 10 min
      expire_at = Time.now.to_i + 60
      
      # update token
      user.update! confirmation_token: token, expire_token_at: expire_at
    end
end
