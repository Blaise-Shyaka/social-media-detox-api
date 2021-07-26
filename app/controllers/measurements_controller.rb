class MeasurementsController < ApplicationController
  rescue_from ActiveRecord::RecordNotSaved, with: :not_saved
  # To Do: Handle Unauthorized personnel

  def create
    @measurement = Measurement.create!(meas_data)
    render json: { status: :created, data: measurement }, status: :created
  end

  def index
    @measurements = Measurement.all
    render json: { status: :ok, data: @measurements }, status: :ok
  end

  private

  # Sanitize parameters sent by user
  def meas_params
    params.permit(:twitter, :instagram, :tiktok, :other)
  end

  # Calculate the total time spent on all social medias
  def calculate_total_time_spent
    meas_params.twitter + meas_params.instagram + meas_params.tiktok + meas_params.other
  end

  # Calculate the progress made by the user today compared to yesterday
  def calculate_progress
    previous_day = Date.now - 1.day
    previous_day_data = Measurement.where('created_at = ?', previous_day)
    previous_day_data.any ? calculate_total_time_spent - previous_day_data.total_time_spent : 0
  end

  # This hash is to be saved as it has all the required fields the Measurement model expects
  def meas_data
    {
      twitter: meas_params.twitter,
      instagram: meas_params.instagram,
      tiktok: meas_params.tiktok,
      other: meas_params.other,
      total_time_spent: calculate_total_time_spent,
      progress: calculate_progress
    }
  end

  def not_saved
    render json: { status: :bad_request, message: 'Verify your input data and try again' }
  end
end
