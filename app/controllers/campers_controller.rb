class CampersController < ApplicationController

  def index
    campers = Camper.all
    render json: campers, status: 200
  end

  def show
    camper = Camper.find(params[:id])
    render json: camper, serializer: CamperShowSerializer
  end

  # Bang ! raises the render_unprocessable_entity_response error if a camper can't be created
  # Error handling in the applications controller allows error messages to work if they appear elsewhere in the code
  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: 201
  end


  private

  def camper_params
    params.permit(:name, :age)
  end

end


#! NOTE >>> This show doesn't require extra steps, but would require extra steps to handle other errors in the code. Find would by adding the not_found error code to application controller. If/else wouldn't be needed in this case
  # def show
  # camper = Camper.find_by(id: params[:id])
      # if camper
      #   render json: camper, serializer: CamperShowSerializer
      # else
      #   render json: {error: 'Camper not found'}, status: :not_found
      # end
  # end