class SignupsController < ApplicationController

  def create
    signup = Signup.create!(signup_params)
    activity = Activity.find(params[:activity_id])
    render json: activity, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: ["validation errors"]}, status: :unprocessable_entity
  end

  private

  def signup_params 
    params.permit(:time, :camper_id, :activity_id)
  end
end
