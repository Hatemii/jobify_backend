class JobsController < ApplicationController
  def index
    jobs = Job.all.order("id DESC")
    render json: jobs
  end

  def show
    job = Job.find(params[:id])
    render json: job
  end

  def new
    job = Job.new
    render json: job
  end

  def create
    job = Job.create(job_params)
    render json: job if job.save
  end

  def edit
    job = Job.find(params[:id])
    render json: job
  end

  def update
    job = Job.find(params[:id])
    render json: job if job.update(job_params)
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy

    render json: "successfully deleted"
  end

  private
    def job_params
      params.permit(:title, :description, :level, :job_type, :salary, :user_id)
    end
end
