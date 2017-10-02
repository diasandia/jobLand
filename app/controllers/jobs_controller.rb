class JobsController < ApplicationController

  protect_from_forgery :except => [:create]

  def index
    jobs = Job.all
    render json: jobs
  end

  def show
    job = Job.find(params[:id])
    render json: job
  end

  def create
    @job = Job.create(url: params[:url])
  end

end
