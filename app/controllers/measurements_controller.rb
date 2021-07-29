class MeasurementsController < ApplicationController
  def create
    @measurement = Measurement.create!(meas_data)
    render json: {
      status: :created,
      data: {
        twitter: @measurement.twitter,
        instagram: @measurement.instagram,
        tiktok: @measurement.tiktok,
        other: @measurement.other
      }
    }, status: :created
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
    params = meas_params
    Integer(params['twitter']) + Integer(params['instagram']) + Integer(params['tiktok']) + Integer(params['other'])
  rescue TypeError
  end

  # Calculate the progress made by the user today compared to yesterday
  def calculate_progress
    previous_day = Date.yesterday
    previous_day_data = Measurement.where('created_at = ?', previous_day)
    previous_day_data.to_a.any? ? calculate_total_time_spent - previous_day_data.total_time_spent : 0
  end

  # This hash is to be saved as it has all the required fields the Measurement model expects
  def meas_data
    params = meas_params
    {
      twitter: params['twitter'],
      instagram: params['instagram'],
      tiktok: params['tiktok'],
      other: params['other'],
      total_time_spent: calculate_total_time_spent,
      progress: calculate_progress,
      user: current_user
    }
  end

  def not_saved
    render json: { status: :bad_request, message: 'Verify your input data and try again' }, status: :bad_request
  end
end
