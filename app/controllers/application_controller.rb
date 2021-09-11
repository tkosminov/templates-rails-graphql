# frozen_string_literal: true

class ApplicationController < ActionController::API
  ## Custom Exceptions

  rescue_from ::Exceptions::Graphql do |exception|
    handle_error(exception, 400)
  end

  ## ActiveRecord Exceptions

  rescue_from ::ActiveRecord::RecordInvalid do |exception|
    handle_error(exception, 400)
  end

  rescue_from ::ActiveRecord::NotNullViolation do |exception|
    handle_error(exception, 400)
  end

  rescue_from ::ActiveRecord::RecordNotUnique do |exception|
    handle_error(exception, 400)
  end

  rescue_from ::ActionController::ParameterMissing do |exception|
    handle_error(exception, 400)
  end

  rescue_from ::ActiveRecord::RecordNotFound do |exception|
    handle_error(exception, 404)
  end

  rescue_from ::ActiveRecord::StatementInvalid do |exception|
    if exception.message.include?('PG::NotNullViolation')
      handle_error(::Exceptions::PGNotNullViolation.new, 400)
    elsif exception.message.include?('PG::UniqueViolation')
      handle_error(::Exceptions::PGUniqueViolation.new(msg: exception.message), 400)
    else
      handle_error(exception, 400)
    end
  end

  rescue_from ::ActiveRecord::RecordNotDestroyed do |exception|
    handle_error(exception, 424)
  end

  rescue_from ::ActiveRecord::DeleteRestrictionError do |exception|
    handle_error(exception, 424)
  end

  ## Base Exceptions

  rescue_from ::ArgumentError do |exception|
    handle_error(exception, 400)
  end

  rescue_from ::StandardError do |exception|
    handle_error(exception, 400)
  end

  private

  def handle_error(exception, status)
    Rails.logger.error(exception.message)
    Rails.logger.error(exception.backtrace&.join("\n"))

    message = {
      message: exception.message,
      extensions: {
        code: status,
        timestamp: DateTime.now,
        exception: {
          result: {
            error: exception.message,
          },
          statusCode: status,
          stacktrace: [],
        },
      },
    }

    if Rails.env.development?
      message[:extensions][:exception][:stacktrace] = exception.backtrace
    end

    render json: { errors: [message], data: {} }, status: status
  end
end
