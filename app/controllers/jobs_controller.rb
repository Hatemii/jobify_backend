class JobsController < ApplicationController

  def index
    jobs = Job.all
    render json: jobs
  end

  def show
    job = find_job
    render json: job if job

    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }
  end

  def create
    job = Job.create! job_params

    if job.valid?
      render json: job
    else
      render json: { message: "Something went wrong" }
    end

    rescue ActiveRecord::RecordInvalid => e
      render json: { message: e.message }

    rescue ArgumentError => e
      render json: { message: e.message }
  end

  def update
    job = find_job

    if job
      job.update! job_params
      render json: job
    end

    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }

    rescue ArgumentError => e
        render json: { message: e.message }
  end

  def destroy
    job = find_job
    render json: {message: "Successfully deleted" } if job.destroy

    rescue ActiveRecord::RecordNotFound => e
        render json: { message: e.message }
  end

  private

    def find_job
      Job.find(params[:id])
    end

    def job_params
      params.permit(:title, :description, :level, :job_type, :salary, :company_id)
    end
end
