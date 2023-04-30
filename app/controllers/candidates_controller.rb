class CandidatesController < ApplicationController

  before_action :authorized
  
  def index
    candidates = Candidate.all

    render json: candidates.map { |candidate|
      candidate.as_json.merge(image: candidate_image(candidate))
    }
  end

  def show
    candidate = find_candidate
    
    render json: candidate.as_json.merge(image: candidate_image(candidate))
    
    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }
  end

  def create
    candidate = Candidate.create! candidate_params

    if candidate.valid?
      render json: candidate.as_json.merge(image: candidate_image(candidate))
    else
      render json: { message: "Something went wrong" }
    end

    rescue ActiveRecord::RecordInvalid => e
      render json: { message: e.message }
  end

  def update
    candidate = find_candidate
    
    if candidate
      data = candidate_params.to_h.except(:user_id, :job_id)

      if data[:image]
        # remove current image
        candidate.image.purge if candidate.image.attached?

        # attach new image
        candidate.image.attach(data[:image])

        render json: candidate.as_json.merge(image: candidate_image(candidate))
      else
        render json: candidate.as_json.merge(image: candidate_image(candidate))  
      end
    end

    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }

    rescue ArgumentError => e
        render json: { message: e.message }
  end

  def destroy
    candidate = find_candidate 
    render json: { message: "Successfully deleted" } if candidate.destroy!
    
    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }
  end

  private

    def find_candidate
      Candidate.find(params[:id])
    end

    def candidate_image(candidate)
      candidate.image.attached? ? url_for(candidate.image) : nil
    end

    def candidate_params
      params.permit(:user_id, :job_id, :image)
    end
end
