class HealthcheckController < ActionController::Base
  def healthz
    render json: { message: 'ok' }, status: 200
  end
end
