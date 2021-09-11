module GraphqlHelper
  def self.get_current_user(headers)
    JSON.parse(headers['currentUser'] || dev_current_user, object_class: OpenStruct)
  end

  def self.get_remote_address(headers)
    if headers['remoteAddress'] != '-'
      return headers['remoteAddress']
    end

    return '::1'
  end

  def self.get_forwarded_address(headers)
    if headers['forwardedAddress'] != '-'
      return headers['forwardedAddress']
    end

    return '127.0.0.1'
  end

  # Handle form data, JSON body, or a blank value
  def self.ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        self.ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError.new("Unexpected parameter: #{ambiguous_param}")
    end
  end

  def self.dev_current_user
    if Rails.env.development?
      {
        id: 1,
        email: 'test@test.test',
      }.to_json
    else
      '{}'
    end
  end
end
