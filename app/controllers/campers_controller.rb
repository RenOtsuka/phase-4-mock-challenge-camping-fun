class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index 
    campers = Camper.all
    render json: campers, only:[:id, :name, :age], status: :ok
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper, only:[:id, :name, :age], include: :activities, status: :ok
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  rescue ActiveRecord::RecordInvalid => invalid
    render json: { errors: ["validation errors"]}, status: :unprocessable_entity
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

  def render_not_found_response
    render json: {error: "Camper not found"}, status: :not_found
  end

end
