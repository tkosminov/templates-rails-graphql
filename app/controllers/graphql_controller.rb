class GraphqlController < ApplicationController
  def append_info_to_payload(payload)
    super
    current_user = ::GraphqlHelper.get_current_user(request.headers)
    payload[:request_id] = request.request_id
    payload[:user_id] = current_user.id
    payload[:params] = params.slice('graphql')
  end

  def execute
    variables = ::GraphqlHelper.ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: ::GraphqlHelper.get_current_user(request.headers),
      remote_address: ::GraphqlHelper.get_remote_address(request.headers),
      forwarded_address: ::GraphqlHelper.get_forwarded_address(request.headers),
    }

    result = ServiceSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    check_graphql_for_errors!(result)

    render json: result
  end

  private

  def check_graphql_for_errors!(graphql_result)
    return if graphql_result['errors'].blank?

    message = graphql_result['errors'].map { |error| error['message'] }.join(', ')

    raise ::Exceptions::Graphql.new(message)
  end
end
