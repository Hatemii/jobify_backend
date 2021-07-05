class CandidatesController < ApplicationController
 def index
    candidates = Candidate.all.order("id DESC")
    render json: candidates
  end

  def show
    candidate = Candidate.find(params[:id])
    render json: candidate
  end

  def new
    candidate = Candidate.new
    render json: candidate
  end

  def edit
    candidate = Candidate.find(params[:id])
    render json: candidate
  end

  def create
    candidate = Candidate.create(candidate_params)
    candidate.job_id = Job.first.id
    candidate.save
    render json: candidate if candidate.save
  end

  def update
    candidate = Candidate.find(params[:id])
    render json: candidate if candidate.update(candidate_params)
  end

  def destroy
    candidate = Candidate.find(params[:id])
    candidate.destroy

    render json: "successfully deleted"
  end

  private
    def candidate_params
      params.permit(:name, :surname, :email, :location, :phone)
    end
end
