class CompaniesController < ApplicationController

  before_action :authorized

  def index
    companies = Company.all
    render json: companies
  end

  def show
    company = find_company
    
    if company
      render json:{
        company: company,
        company_users: company.company_users
      }
    else
      render json: { message: "Company not found" }
    end
  end

  def create
    company = Company.create! company_params
    
    if company.valid?
      create_admin(company)
      render json: company
    else
      rener json:{ message: "Something went wrong" }
    end

    rescue ActiveRecord::RecordInvalid => e
      render json: { message: e.message }
  end

  def update
    company = find_company

    if company
      company.update! company_params
      render json: company
    end

    rescue ActiveRecord::RecordNotFound => e
      render json: { message: e.message }
  end

  def destroy
    company = find_company
    render json: "Company deleted successfully" if company.destroy!
    
    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }
  end
  

  private

    def find_company
      Company.find(params[:id])
    end

    def create_admin(company)
      company.company_users.create! user_id: current_user.id, role: "admin"
    end

    def company_params
      params.permit(:name)
    end
end
