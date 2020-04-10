class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from Blueprinter::BlueprinterError, with: :invalid_blueprinter

  def invalid_blueprinter(exception)
    render json: { error: exception.message }.to_json, status: 500
    return
  end
end
