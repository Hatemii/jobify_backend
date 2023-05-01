class CompanyUsersController < ApplicationController

  def index
    company_users = CompanyUser.all.where(company_id: params[:company_id])
    render json: company_users
  end

  def show
    company_user = find_company_user
    render json: company_user if company_user

    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }
  end

  def create
    company_user = CompanyUser.create! company_user_params

    if company_user.valid?
      render json: company_user
    else
      render json: { message: "Something went wrong" }
    end

    rescue ActiveRecord::RecordInvalid => e
      render json: { message: e.message }
  end

  def update
    company_user = find_company_user

    if company_user
      company_user.update! company_user_params
      render json: company_user
    end

    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }

    rescue ArgumentError => e
        render json: { message: e.message }
  end

  def destroy
    company_user = find_company_user
    render json: {message: "Successfully deleted" } if company_user.destroy

    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }
  end

  private

    def find_company_user
      CompanyUser.find(params[:id])
    end

    def company_user_params
      params.permit(:company_id, :user_id, :role)
    end
end
