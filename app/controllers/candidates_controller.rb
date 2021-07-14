class CandidatesController < ApplicationController
  
  def index
    candidates = Candidate.all.order("id DESC")
    render json: candidates.map{ |candidate| 
      candidate.as_json.merge(image: url_for(candidate.image))
    }
  end

  def show
    candidate = Candidate.find(params[:id])
    render json: candidate.as_json.merge(image: url_for(candidate.image))
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
    # candidate.images.attach(params[:images])
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
      params.permit(:name, :surname, :email, :location, :phone, :job_id, :image)
    end
end
