class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  private

  def not_found(invalid)
      render json: {error: "#{invalid.model} not found"}, status: 404
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: 422
  end

end
